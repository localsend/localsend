#include "my_application.h"

#include <cstddef>
#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif
#ifdef GDK_WINDOWING_WAYLAND
#include <gdk/gdkwayland.h>
#endif

#include "flutter/generated_plugin_registrant.h"

#include <errno.h>
#include <glib/gstdio.h>
#include <stdlib.h>
#include <string.h>

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
  bool is_wayland;
  // Directory holding the software rendering files, see get_state_dir().
  gchar* state_dir;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Software rendering (https://github.com/localsend/localsend/issues/3233).
//
// The Flutter engine reads FLUTTER_LINUX_RENDERER when it is created, so the
// renderer has to be chosen here, before the FlView exists.
// - kSoftwareRenderingFile: exists while software rendering is enabled.
//   Written by the settings toggle and by the crash fallback below.
// - kRenderCheckFile: written before an OpenGL launch and deleted shortly
//   after the first frame. If it still exists on the next launch, the previous
//   one died before it could render (e.g. "No provider of glBlitFramebuffer
//   found" aborts the process), so we switch to software rendering.
static const char kSoftwareRenderingFile[] = "software_rendering";
static const char kRenderCheckFile[] = "render_check";
static const guint kRenderCheckSeconds = 3;

// Returns the directory next to the executable in portable mode (settings.json
// next to the executable, see shared_preferences_portable.dart), otherwise the
// app's data directory (~/.local/share/org.localsend.localsend_app).
static gchar* get_state_dir() {
  g_autofree gchar* exe = g_file_read_link("/proc/self/exe", nullptr);
  if (exe != nullptr) {
    gchar* exe_dir = g_path_get_dirname(exe);
    g_autofree gchar* portable_settings =
        g_build_filename(exe_dir, "settings.json", nullptr);
    if (g_file_test(portable_settings, G_FILE_TEST_EXISTS)) {
      return exe_dir;
    }
    g_free(exe_dir);
  }
  return g_build_filename(g_get_user_data_dir(), APPLICATION_ID, nullptr);
}

static bool state_file_exists(MyApplication* self, const char* name) {
  g_autofree gchar* path = g_build_filename(self->state_dir, name, nullptr);
  return g_file_test(path, G_FILE_TEST_EXISTS);
}

static bool write_state_file(MyApplication* self, const char* name) {
  g_autoptr(GError) error = nullptr;
  if (g_mkdir_with_parents(self->state_dir, 0700) != 0) {
    g_warning("Failed to create %s", self->state_dir);
    return false;
  }
  g_autofree gchar* path = g_build_filename(self->state_dir, name, nullptr);
  if (!g_file_set_contents(path, "", 0, &error)) {
    g_warning("Failed to write %s: %s", path, error->message);
    return false;
  }
  return true;
}

static bool delete_state_file(MyApplication* self, const char* name) {
  g_autofree gchar* path = g_build_filename(self->state_dir, name, nullptr);
  if (g_unlink(path) != 0 && errno != ENOENT) {
    g_warning("Failed to delete %s: %s", path, g_strerror(errno));
    return false;
  }
  return true;
}

static bool software_rendering_requested() {
  return g_strcmp0(g_getenv("FLUTTER_LINUX_RENDERER"), "software") == 0;
}

// Decides the renderer for this launch. Must run before the FlView is created.
// Returns true if the render check was armed.
static bool setup_renderer(MyApplication* self, bool start_hidden) {
  if (software_rendering_requested()) {
    // Set by the user, nothing to decide.
    return false;
  }

  if (state_file_exists(self, kSoftwareRenderingFile)) {
    g_setenv("FLUTTER_LINUX_RENDERER", "software", TRUE);
    return false;
  }

  if (state_file_exists(self, kRenderCheckFile)) {
    g_warning(
        "The previous launch exited before rendering its first frame. "
        "Enabling software rendering, it can be disabled in the settings.");
    write_state_file(self, kSoftwareRenderingFile);
    delete_state_file(self, kRenderCheckFile);
    g_setenv("FLUTTER_LINUX_RENDERER", "software", TRUE);
    return false;
  }

  if (start_hidden) {
    // A hidden window may never render, which would look like a crash.
    return false;
  }

  return write_state_file(self, kRenderCheckFile);
}

static gboolean render_check_passed_cb(gpointer user_data) {
  MyApplication* self = MY_APPLICATION(user_data);
  delete_state_file(self, kRenderCheckFile);
  g_object_unref(self);
  return G_SOURCE_REMOVE;
}

static void first_frame_cb(MyApplication* self, FlView* view) {
  // The first frame is drawn right after this signal, so give the renderer a
  // moment before declaring it working.
  g_timeout_add_seconds(kRenderCheckSeconds, render_check_passed_cb,
                        g_object_ref(self));
}

static void platform_method_call_cb(FlMethodChannel* channel,
                                    FlMethodCall* method_call,
                                    gpointer user_data) {
  MyApplication* self = MY_APPLICATION(user_data);
  const gchar* method = fl_method_call_get_name(method_call);
  g_autoptr(FlMethodResponse) response = nullptr;
  if (strcmp(method, "isWayland") == 0) {
    response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_bool(self->is_wayland)));
  } else if (strcmp(method, "isSoftwareRenderingEnabled") == 0) {
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(
        fl_value_new_bool(state_file_exists(self, kSoftwareRenderingFile))));
  } else if (strcmp(method, "setSoftwareRenderingEnabled") == 0) {
    FlValue* args = fl_method_call_get_args(method_call);
    if (fl_value_get_type(args) != FL_VALUE_TYPE_BOOL) {
      response = FL_METHOD_RESPONSE(fl_method_error_response_new(
          "INVALID_ARGUMENTS", "Expected a bool", nullptr));
    } else {
      bool success = fl_value_get_bool(args)
                         ? write_state_file(self, kSoftwareRenderingFile)
                         : delete_state_file(self, kSoftwareRenderingFile);
      response = FL_METHOD_RESPONSE(
          fl_method_success_response_new(fl_value_new_bool(success)));
    }
  } else if (strcmp(method, "cancelRenderCheck") == 0) {
    // Called before exiting intentionally without rendering (e.g. when handing
    // over to an already running instance).
    delete_state_file(self, kRenderCheckFile);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }
  fl_method_call_respond(method_call, response, nullptr);
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  // Check if --hidden is present in arguments
  bool start_hidden = false;
  if (self->dart_entrypoint_arguments != nullptr) {
    for (int i = 0; self->dart_entrypoint_arguments[i] != nullptr; i++) {
      if (strcmp(self->dart_entrypoint_arguments[i], "--hidden") == 0) {
        start_hidden = true;
        break;
      }
    }
  }

  // If have GTK_CSD in env and it is equal to 1 then add the gtk header bar
  // to always use client side decorations
  const char* GTK_CSD = getenv("GTK_CSD");
  if (GTK_CSD && strcmp(GTK_CSD, "1") == 0) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "LocalSend");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "LocalSend");
  }

  gtk_window_set_default_size(window, 400, 500);

  if (!start_hidden) {
    gtk_widget_show(GTK_WIDGET(window));
  } else {
    // Realize the window so plugins (like tray) can initialize, 
    // but don't map it to the screen.
    gtk_widget_realize(GTK_WIDGET(window));
  }

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  bool render_check = setup_renderer(self, start_hidden);

  FlView* view = fl_view_new(project);

  if (render_check) {
    g_signal_connect_swapped(view, "first-frame", G_CALLBACK(first_frame_cb),
                             self);
  }

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) platform_channel = fl_method_channel_new(
      fl_engine_get_binary_messenger(fl_view_get_engine(view)),
      "org.localsend.localsend_app/platform", FL_METHOD_CODEC(codec));
#ifdef GDK_WINDOWING_WAYLAND
  self->is_wayland = GDK_IS_WAYLAND_DISPLAY(
      gtk_widget_get_display(GTK_WIDGET(window)));
#endif
  fl_method_channel_set_method_call_handler(
      platform_channel, platform_method_call_cb, self, nullptr);

  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  if (!start_hidden) {
    gtk_widget_grab_focus(GTK_WIDGET(view));
  }
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application, gchar*** arguments, int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
     g_warning("Failed to register: %s", error->message);
     *exit_status = 1;
     return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  g_clear_pointer(&self->state_dir, g_free);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line = my_application_local_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {
  self->state_dir = get_state_dir();
}

MyApplication* my_application_new() {
  // Set the program name to the application ID, which helps various systems
  // like GTK and desktop environments map this running application to its
  // corresponding .desktop file. This ensures better integration by allowing
  // the application to be recognized beyond its binary name.
  g_set_prgname(APPLICATION_ID);
  // Use a readable application name for the system tray.
  g_set_application_name("LocalSend");

  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID,
                                     "flags", G_APPLICATION_NON_UNIQUE,
                                     nullptr));
}
