#ifndef FLUTTER_FILE_DIALOG_H_
#define FLUTTER_FILE_DIALOG_H_

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

// Registers the `org.localsend.localsend_app/file_dialog` method channel.
//
// The dialog is opened through the XDG desktop portal (the system file chooser)
// and falls back to the built-in GTK dialog when the portal is unavailable or
// broken. GtkFileChooserNative is deliberately not used: its portal path hides
// backend errors and leaves the picker waiting forever, while this direct call
// can detect the failure and fall back.
void file_dialog_register(FlView* view, GtkWindow* window);

#endif  // FLUTTER_FILE_DIALOG_H_
