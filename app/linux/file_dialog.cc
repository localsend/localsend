#include "file_dialog.h"

#include <gio/gio.h>

#include <cstring>

namespace {

constexpr char kMethodChannelName[] = "org.localsend.localsend_app/file_dialog";
constexpr char kPortalDestination[] = "org.freedesktop.portal.Desktop";
constexpr char kPortalObjectPath[] = "/org/freedesktop/portal/desktop";
constexpr char kPortalFileChooserInterface[] = "org.freedesktop.portal.FileChooser";
constexpr char kPortalRequestInterface[] = "org.freedesktop.portal.Request";
constexpr guint kPortalCallTimeoutMs = 10000;
// `directory` was added to the FileChooser portal in version 3.
constexpr guint kPortalDirectoryVersion = 3;
// org.freedesktop.portal.Request.Response codes.
constexpr guint32 kPortalResponseSuccess = 0;
constexpr guint32 kPortalResponseCancelled = 1;
constexpr guint32 kPortalResponseOther = 2;

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
  gchar* handle_path = nullptr;
  gboolean finished = FALSE;
};

void file_dialog_request_free(FileDialogRequest* request) {
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

  if (request->response_subscription != 0 && request->connection != nullptr) {
    g_dbus_connection_signal_unsubscribe(request->connection, request->response_subscription);
    request->response_subscription = 0;
  }

  g_autoptr(FlValue) result = fl_value_new_list();
  for (GSList* node = paths; node != nullptr; node = node->next) {
    fl_value_append_take(result, fl_value_new_string(static_cast<const gchar*>(node->data)));
  }
  g_slist_free_full(paths, g_free);

  fl_method_call_respond_success(request->method_call, result, nullptr);
  file_dialog_request_free(request);
}

// Runs GTK's own file chooser. Only used when the process can access files
// directly, or as a last resort when the portal is unavailable.
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

  if (request->response_subscription != 0 && request->connection != nullptr) {
    g_dbus_connection_signal_unsubscribe(request->connection, request->response_subscription);
    request->response_subscription = 0;
  }

  finish_with_paths(request, run_in_process_dialog(request));
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

  guint32 response = 0;
  g_autoptr(GVariant) results = nullptr;
  g_variant_get(parameters, "(u@a{sv})", &response, &results);

  if (response == kPortalResponseOther) {
    // The backend accepted the request but could not complete the interaction.
    // GtkFileChooserNative silently stalls in this case; fall back instead.
    g_warning("LocalSend: XDG desktop portal file chooser ended unexpectedly, falling back");
    fall_back_to_in_process_dialog(request);
    return;
  }

  if (response == kPortalResponseCancelled) {
    finish_with_paths(request, nullptr);
    return;
  }

  GSList* paths = nullptr;
  if (response == kPortalResponseSuccess) {
    g_autoptr(GVariant) uris = g_variant_lookup_value(results, "uris", G_VARIANT_TYPE_STRING_ARRAY);
    if (uris != nullptr) {
      const gsize uri_count = g_variant_n_children(uris);
      for (gsize i = 0; i < uri_count; i++) {
        const gchar* uri = nullptr;
        g_variant_get_child(uris, i, "&s", &uri);
        g_autofree gchar* path = g_filename_from_uri(uri, nullptr, nullptr);
        if (path != nullptr) {
          paths = g_slist_prepend(paths, g_strdup(path));
        }
      }
      paths = g_slist_reverse(paths);
    }
  }

  finish_with_paths(request, paths);
}

void portal_open_file_cb(GObject* source_object, GAsyncResult* result, gpointer user_data) {
  auto* request = static_cast<FileDialogRequest*>(user_data);

  g_autoptr(GError) error = nullptr;
  g_autoptr(GVariant) reply = g_dbus_connection_call_finish(G_DBUS_CONNECTION(source_object), result, &error);
  if (reply == nullptr) {
    // GtkFileChooserNative silently stops waiting in this case, leaving the
    // caller with a dialog that never appears. Fall back instead.
    g_warning("LocalSend: XDG desktop portal rejected the file chooser request: %s", error->message);
    fall_back_to_in_process_dialog(request);
    return;
  }

  const gchar* handle_path = nullptr;
  g_variant_get(reply, "(&o)", &handle_path);
  g_free(request->handle_path);
  request->handle_path = g_strdup(handle_path);
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
    g_warning("LocalSend: cannot connect to the session bus: %s", error->message);
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

  g_autofree gchar* handle_token = g_strdup_printf("localsend_%u", next_handle_token++);

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
