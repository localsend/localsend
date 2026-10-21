#include "file_dialog.h"

#include <gio/gio.h>

#include <cstring>

namespace {

constexpr char kMethodChannelName[] = "org.localsend.localsend_app/file_dialog";
constexpr char kPortalDestination[] = "org.freedesktop.portal.Desktop";
constexpr char kPortalObjectPath[] = "/org/freedesktop/portal/desktop";
constexpr char kPortalFileChooserInterface[] = "org.freedesktop.portal.FileChooser";
constexpr char kPortalRequestInterface[] = "org.freedesktop.portal.Request";
constexpr char kPortalRequestPathPrefix[] = "/org/freedesktop/portal/desktop/request/";
constexpr guint kPortalCallTimeoutMs = 10000;
// Generous watchdog for a portal that returns a request handle but never emits
// Response. It is not meant to interrupt normal user interaction.
constexpr guint kPortalResponseTimeoutSeconds = 600;
// `directory` was added to the FileChooser portal in version 3.
constexpr guint kPortalDirectoryVersion = 3;
// org.freedesktop.portal.Request.Response codes.
constexpr guint32 kPortalResponseSuccess = 0;
constexpr guint32 kPortalResponseCancelled = 1;

guint next_handle_token = 0;

struct FileDialogRequest {
  FlMethodCall* method_call = nullptr;
  GtkWindow* window = nullptr;
  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
  gboolean multiple = FALSE;
  gchar* title = nullptr;
  gchar* accept_label = nullptr;
  gchar* cancel_label = nullptr;
  GDBusConnection* connection = nullptr;
  gulong response_subscription = 0;
  guint response_timeout_id = 0;
  gchar* handle_path = nullptr;
  GVariant* early_response = nullptr;
  gboolean open_call_done = FALSE;
  gboolean finished = FALSE;
};

void unsubscribe_portal_response(FileDialogRequest* request) {
  if (request->response_subscription != 0 && request->connection != nullptr) {
    g_dbus_connection_signal_unsubscribe(request->connection, request->response_subscription);
    request->response_subscription = 0;
  }
}

void file_dialog_request_free(FileDialogRequest* request) {
  unsubscribe_portal_response(request);

  if (request->response_timeout_id != 0) {
    g_source_remove(request->response_timeout_id);
    request->response_timeout_id = 0;
  }

  g_clear_pointer(&request->early_response, g_variant_unref);
  g_clear_object(&request->method_call);
  g_clear_object(&request->window);
  g_clear_object(&request->connection);
  g_free(request->title);
  g_free(request->accept_label);
  g_free(request->cancel_label);
  g_free(request->handle_path);
  g_free(request);
}

void finish_with_paths(FileDialogRequest* request, GSList* paths) {
  if (request->finished) {
    g_slist_free_full(paths, g_free);
    return;
  }
  request->finished = TRUE;

  unsubscribe_portal_response(request);

  g_autoptr(FlValue) result = fl_value_new_list();
  for (GSList* node = paths; node != nullptr; node = node->next) {
    fl_value_append_take(result, fl_value_new_string(static_cast<const gchar*>(node->data)));
  }
  g_slist_free_full(paths, g_free);

  fl_method_call_respond_success(request->method_call, result, nullptr);
  file_dialog_request_free(request);
}

// Runs GTK's own file chooser as a fallback when the portal cannot be used.
GSList* run_in_process_dialog(FileDialogRequest* request) {
  const gchar* accept_label = request->accept_label != nullptr ? request->accept_label : "_Open";
  const gchar* cancel_label = request->cancel_label != nullptr ? request->cancel_label : "_Cancel";

  GtkWidget* dialog = gtk_file_chooser_dialog_new(
      request->title,
      request->window,
      request->action,
      cancel_label,
      GTK_RESPONSE_CANCEL,
      accept_label,
      GTK_RESPONSE_ACCEPT,
      nullptr);

  gtk_file_chooser_set_select_multiple(GTK_FILE_CHOOSER(dialog), request->multiple);
  if (request->action == GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER) {
    gtk_file_chooser_set_create_folders(GTK_FILE_CHOOSER(dialog), FALSE);
  }
  gtk_window_set_modal(GTK_WINDOW(dialog), TRUE);

  GSList* paths = nullptr;
  if (gtk_dialog_run(GTK_DIALOG(dialog)) == GTK_RESPONSE_ACCEPT) {
    paths = gtk_file_chooser_get_filenames(GTK_FILE_CHOOSER(dialog));
  }

  gtk_widget_destroy(dialog);
  return paths;
}

void fall_back_to_in_process_dialog(FileDialogRequest* request) {
  if (request->finished) {
    return;
  }

  unsubscribe_portal_response(request);

  // The in-process dialog runs a nested main loop. Cancel the watchdog first
  // so it cannot open a second dialog while this one is still open.
  if (request->response_timeout_id != 0) {
    g_source_remove(request->response_timeout_id);
    request->response_timeout_id = 0;
  }

  finish_with_paths(request, run_in_process_dialog(request));
}

void close_portal_request(FileDialogRequest* request) {
  if (request->connection == nullptr || request->handle_path == nullptr) {
    return;
  }

  g_dbus_connection_call(
      request->connection,
      kPortalDestination,
      request->handle_path,
      kPortalRequestInterface,
      "Close",
      nullptr,
      nullptr,
      G_DBUS_CALL_FLAGS_NONE,
      -1,
      nullptr,
      nullptr,
      nullptr);
}

gboolean response_timeout_cb(gpointer user_data) {
  auto* request = static_cast<FileDialogRequest*>(user_data);
  request->response_timeout_id = 0;
  if (request->finished) {
    return G_SOURCE_REMOVE;
  }

  g_warning("LocalSend: XDG desktop portal file chooser did not respond, falling back");
  close_portal_request(request);
  fall_back_to_in_process_dialog(request);
  return G_SOURCE_REMOVE;
}

void handle_portal_response(FileDialogRequest* request, GVariant* parameters) {
  guint32 response = 0;
  g_autoptr(GVariant) results = nullptr;
  g_variant_get(parameters, "(u@a{sv})", &response, &results);

  if (response == kPortalResponseCancelled) {
    finish_with_paths(request, nullptr);
    return;
  }

  if (response != kPortalResponseSuccess) {
    // Code 2 means the backend accepted the request but could not complete it;
    // any other value is outside the current portal protocol. GtkFileChooserNative
    // silently stalls in this case, so fall back instead.
    g_warning("LocalSend: XDG desktop portal file chooser failed (response %u), falling back", response);
    fall_back_to_in_process_dialog(request);
    return;
  }

  g_autoptr(GVariant) uris = g_variant_lookup_value(results, "uris", G_VARIANT_TYPE_STRING_ARRAY);
  const gsize uri_count = uris != nullptr ? g_variant_n_children(uris) : 0;
  if (uri_count == 0) {
    g_warning("LocalSend: XDG desktop portal returned no file URIs, falling back");
    fall_back_to_in_process_dialog(request);
    return;
  }

  GSList* paths = nullptr;
  for (gsize i = 0; i < uri_count; i++) {
    const gchar* uri = nullptr;
    g_variant_get_child(uris, i, "&s", &uri);
    g_autofree gchar* path = g_filename_from_uri(uri, nullptr, nullptr);
    if (path == nullptr) {
      g_slist_free_full(paths, g_free);
      g_warning("LocalSend: XDG desktop portal returned a non-file URI, falling back");
      fall_back_to_in_process_dialog(request);
      return;
    }
    paths = g_slist_prepend(paths, g_strdup(path));
  }
  paths = g_slist_reverse(paths);

  finish_with_paths(request, paths);
}

void portal_response_cb(GDBusConnection* connection,
                        const gchar* sender_name,
                        const gchar* object_path,
                        const gchar* interface_name,
                        const gchar* signal_name,
                        GVariant* parameters,
                        gpointer user_data) {
  auto* request = static_cast<FileDialogRequest*>(user_data);
  if (request->finished || request->handle_path == nullptr) {
    return;
  }
  if (g_strcmp0(object_path, request->handle_path) != 0) {
    return;
  }

  if (!request->open_call_done) {
    // A fast portal can emit Response before the OpenFile reply stores the
    // handle. Keep the first matching response until the handle is known.
    g_clear_pointer(&request->early_response, g_variant_unref);
    request->early_response = g_variant_ref(parameters);
    return;
  }

  handle_portal_response(request, parameters);
}

void portal_open_file_cb(GObject* source_object, GAsyncResult* result, gpointer user_data) {
  auto* request = static_cast<FileDialogRequest*>(user_data);

  g_autoptr(GError) error = nullptr;
  g_autoptr(GVariant) reply = g_dbus_connection_call_finish(G_DBUS_CONNECTION(source_object), result, &error);
  if (reply == nullptr) {
    // GtkFileChooserNative silently stops waiting in this case, leaving the
    // caller with a dialog that never appears. Fall back instead.
    g_warning("LocalSend: XDG desktop portal rejected the file chooser request: %s", error != nullptr ? error->message : "unknown error");
    fall_back_to_in_process_dialog(request);
    return;
  }

  const gchar* handle_path = nullptr;
  g_variant_get(reply, "(&o)", &handle_path);

  if (g_strcmp0(handle_path, request->handle_path) != 0) {
    // The portal did not use the expected request path. A buffered response
    // belongs to the old path and must not complete this request.
    g_clear_pointer(&request->early_response, g_variant_unref);
    g_free(request->handle_path);
    request->handle_path = g_strdup(handle_path);
  }

  request->open_call_done = TRUE;
  request->response_timeout_id = g_timeout_add_seconds(kPortalResponseTimeoutSeconds, response_timeout_cb, request);
  if (request->response_timeout_id == 0) {
    g_warning("LocalSend: cannot start XDG desktop portal response watchdog, falling back");
    close_portal_request(request);
    fall_back_to_in_process_dialog(request);
    return;
  }

  if (request->early_response != nullptr) {
    GVariant* early_response = request->early_response;
    request->early_response = nullptr;
    handle_portal_response(request, early_response);
    g_variant_unref(early_response);
  }
}

guint get_portal_file_chooser_version(GDBusConnection* connection) {
  g_autoptr(GError) error = nullptr;
  g_autoptr(GVariant) reply = g_dbus_connection_call_sync(
      connection,
      kPortalDestination,
      kPortalObjectPath,
      "org.freedesktop.DBus.Properties",
      "Get",
      g_variant_new("(ss)", kPortalFileChooserInterface, "version"),
      G_VARIANT_TYPE("(v)"),
      G_DBUS_CALL_FLAGS_NONE,
      2000,
      nullptr,
      &error);

  if (reply == nullptr) {
    return 0;
  }

  g_autoptr(GVariant) value = g_variant_get_child_value(reply, 0);
  g_autoptr(GVariant) version = g_variant_get_variant(value);
  if (!g_variant_is_of_type(version, G_VARIANT_TYPE_UINT32)) {
    return 0;
  }
  return g_variant_get_uint32(version);
}

void start_portal_dialog(FileDialogRequest* request) {
  g_autoptr(GError) error = nullptr;
  GDBusConnection* connection = g_bus_get_sync(G_BUS_TYPE_SESSION, nullptr, &error);
  if (connection == nullptr) {
    g_warning("LocalSend: cannot connect to the session bus: %s", error != nullptr ? error->message : "unknown error");
    fall_back_to_in_process_dialog(request);
    return;
  }
  request->connection = connection;

  const guint version = get_portal_file_chooser_version(connection);
  const gboolean directory = request->action == GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER;
  if (version == 0 || (directory && version < kPortalDirectoryVersion)) {
    g_message("LocalSend: XDG desktop portal FileChooser (version %u) cannot select this dialog type", version);
    fall_back_to_in_process_dialog(request);
    return;
  }

  g_autofree gchar* handle_token = g_strdup_printf("localsend_%u", next_handle_token++);

  // The portal derives the request path from our unique name and handle_token.
  // Set it before subscribing so that a response arriving before the OpenFile
  // reply can be buffered instead of being dropped.
  const gchar* unique_name = g_dbus_connection_get_unique_name(connection);
  if (unique_name != nullptr) {
    const gchar* sender = unique_name[0] == ':' ? unique_name + 1 : unique_name;
    g_autofree gchar* sender_path = g_strdup(sender);
    for (gchar* c = sender_path; *c != '\0'; c++) {
      if (*c == '.') {
        *c = '_';
      }
    }
    request->handle_path = g_strdup_printf("%s%s/%s", kPortalRequestPathPrefix, sender_path, handle_token);
  }

  request->response_subscription = g_dbus_connection_signal_subscribe(
      connection,
      kPortalDestination,
      kPortalRequestInterface,
      "Response",
      nullptr,
      nullptr,
      G_DBUS_SIGNAL_FLAGS_NONE,
      portal_response_cb,
      request,
      nullptr);
  if (request->response_subscription == 0) {
    g_warning("LocalSend: cannot subscribe to XDG desktop portal responses, falling back");
    fall_back_to_in_process_dialog(request);
    return;
  }

  GVariantBuilder options;
  g_variant_builder_init(&options, G_VARIANT_TYPE_VARDICT);
  g_variant_builder_add(&options, "{sv}", "handle_token", g_variant_new_string(handle_token));
  g_variant_builder_add(&options, "{sv}", "multiple", g_variant_new_boolean(request->multiple));
  g_variant_builder_add(&options, "{sv}", "modal", g_variant_new_boolean(FALSE));
  if (directory) {
    g_variant_builder_add(&options, "{sv}", "directory", g_variant_new_boolean(TRUE));
  }
  if (request->accept_label != nullptr) {
    g_variant_builder_add(&options, "{sv}", "accept_label", g_variant_new_string(request->accept_label));
  }

  g_dbus_connection_call(
      connection,
      kPortalDestination,
      kPortalObjectPath,
      kPortalFileChooserInterface,
      "OpenFile",
      g_variant_new("(ss@a{sv})", "", request->title, g_variant_builder_end(&options)),
      G_VARIANT_TYPE("(o)"),
      G_DBUS_CALL_FLAGS_NONE,
      kPortalCallTimeoutMs,
      nullptr,
      portal_open_file_cb,
      request);
}

const gchar* get_string_argument(FlValue* arguments, const gchar* name, const gchar* fallback) {
  if (arguments == nullptr || fl_value_get_type(arguments) != FL_VALUE_TYPE_MAP) {
    return fallback;
  }

  FlValue* value = fl_value_lookup_string(arguments, name);
  if (value == nullptr || fl_value_get_type(value) != FL_VALUE_TYPE_STRING) {
    return fallback;
  }

  const gchar* string = fl_value_get_string(value);
  return string[0] != '\0' ? string : fallback;
}

void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call, gpointer user_data) {
  auto* window = GTK_WINDOW(user_data);
  const gchar* method = fl_method_call_get_name(method_call);
  FlValue* arguments = fl_method_call_get_args(method_call);

  GtkFileChooserAction action;
  gboolean multiple;
  if (std::strcmp(method, "openFiles") == 0) {
    action = GTK_FILE_CHOOSER_ACTION_OPEN;
    multiple = TRUE;
  } else if (std::strcmp(method, "pickDirectory") == 0) {
    action = GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER;
    multiple = FALSE;
  } else {
    g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
    fl_method_call_respond(method_call, response, nullptr);
    return;
  }

  auto* request = g_new0(FileDialogRequest, 1);
  request->method_call = FL_METHOD_CALL(g_object_ref(method_call));
  request->window = GTK_WINDOW(g_object_ref(window));
  request->action = action;
  request->multiple = multiple;
  request->title = g_strdup(get_string_argument(arguments, "title", "LocalSend"));
  request->accept_label = g_strdup(get_string_argument(arguments, "acceptLabel", "Open"));
  request->cancel_label = g_strdup(get_string_argument(arguments, "cancelLabel", "Cancel"));

  start_portal_dialog(request);
}

}  // namespace

void file_dialog_register(FlView* view, GtkWindow* window) {
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel = fl_method_channel_new(
      fl_engine_get_binary_messenger(fl_view_get_engine(view)),
      kMethodChannelName,
      FL_METHOD_CODEC(codec));

  fl_method_channel_set_method_call_handler(
      channel,
      method_call_cb,
      g_object_ref(window),
      g_object_unref);
}
