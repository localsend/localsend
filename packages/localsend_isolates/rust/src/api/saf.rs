//! Android Storage Access Framework (SAF) file opener via JNI.
//!
//! Uses `ContentResolver.openFileDescriptor()` to convert a `content://`
//! URI into a raw file descriptor that Rust can mmap / read directly.
//! Only compiled on Android.
//!
//! JVM discovery: Kotlin `MainActivity` calls `System.loadLibrary` to
//! register our native library with the JVM, then calls the
//! `initializeRustJni` native method which captures the `JavaVM`
//! reference for later use by SAF functions.

use std::fs::File;
use std::os::fd::FromRawFd;
use std::sync::OnceLock;

use jni::objects::JValueGen;
use jni::{JNIEnv, JavaVM};

// ─── JVM storage ────────────────────────────────────────────────────

/// Process-global `JavaVM` reference, captured once from the Kotlin
/// `initializeRustJni` native method call.
static JAVA_VM: OnceLock<JavaVM> = OnceLock::new();

/// JNI native method called from Kotlin `MainActivity.configureFlutterEngine()`.
///
/// Name follows JNI mangling for:
///   package `org.localsend.localsend_app`, class `MainActivity`,
///   method `initializeRustJni`.
///
/// Underscores in identifiers are escaped as `_1` per the JNI spec.
#[unsafe(no_mangle)]
pub extern "system" fn Java_org_localsend_localsend_1app_MainActivity_initializeRustJni(
    env: JNIEnv<'_>,
    _class: jni::objects::JClass<'_>,
) {
    match env.get_java_vm() {
        Ok(vm) => {
            let _ = JAVA_VM.set(vm);
        }
        Err(e) => {
            // Log but don't panic — the app should still work without SAF.
            eprintln!("initializeRustJni: get_java_vm failed: {e}");
        }
    }
}

fn get_java_vm() -> Result<&'static JavaVM, String> {
    JAVA_VM.get().ok_or_else(|| {
        "JVM not initialized — initializeRustJni not called from Kotlin".to_string()
    })
}

// ─── Public API ─────────────────────────────────────────────────────

/// Open a `content://` URI for reading via Android's ContentResolver.
///
/// Returns a [`File`] backed by the ParcelFileDescriptor obtained from
/// the SAF.  The caller takes ownership of the fd (it has been detached
/// from the JVM side).
pub fn open_content_uri(uri: &str) -> Result<File, String> {
    let vm = get_java_vm()?;
    let mut env = vm
        .attach_current_thread()
        .map_err(|e| format!("JNI: failed to attach thread: {e}"))?;

    let context = get_application_context(&mut env)?;

    // context.getContentResolver()
    let content_resolver = env
        .call_method(
            &context,
            "getContentResolver",
            "()Landroid/content/ContentResolver;",
            &[],
        )
        .map_err(|e| format!("JNI: getContentResolver: {e}"))?
        .l()
        .map_err(|e| format!("JNI: getContentResolver returned non-object: {e}"))?;

    // Uri.parse(uri)
    let uri_str = env
        .new_string(uri)
        .map_err(|e| format!("JNI: new_string: {e}"))?;
    let uri_obj = env
        .call_static_method(
            "android/net/Uri",
            "parse",
            "(Ljava/lang/String;)Landroid/net/Uri;",
            &[JValueGen::Object(&uri_str)],
        )
        .map_err(|e| format!("JNI: Uri.parse: {e}"))?
        .l()
        .map_err(|e| format!("JNI: Uri.parse returned non-object: {e}"))?;

    // contentResolver.openFileDescriptor(uri, "r")
    let mode_str = env
        .new_string("r")
        .map_err(|e| format!("JNI: new_string: {e}"))?;
    let parcel_fd = env
        .call_method(
            &content_resolver,
            "openFileDescriptor",
            "(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;",
            &[JValueGen::Object(&uri_obj), JValueGen::Object(&mode_str)],
        )
        .map_err(|e| format!("JNI: openFileDescriptor({uri}): {e}"))?
        .l()
        .map_err(|e| format!("JNI: openFileDescriptor returned non-object: {e}"))?;

    // parcelFd.detachFd()
    let fd = env
        .call_method(&parcel_fd, "detachFd", "()I", &[])
        .map_err(|e| format!("JNI: detachFd: {e}"))?
        .i()
        .map_err(|e| format!("JNI: detachFd returned non-int: {e}"))?;

    if fd < 0 {
        return Err(format!("JNI: detachFd returned invalid fd: {fd}"));
    }

    // SAFETY: detachFd transfers ownership of the fd to us.
    Ok(unsafe { File::from_raw_fd(fd) })
}

/// Open a `content://` URI for **writing** via Android's ContentResolver.
///
/// Uses mode `"w"` (truncate). The URI must point to an already-created
/// document (e.g. via `createDocument` on the Dart side).  Returns a
/// [`File`] backed by the ParcelFileDescriptor obtained from SAF.
pub fn create_content_uri(uri: &str) -> Result<File, String> {
    let vm = get_java_vm()?;
    let mut env = vm
        .attach_current_thread()
        .map_err(|e| format!("JNI: failed to attach thread: {e}"))?;

    let context = get_application_context(&mut env)?;

    // context.getContentResolver()
    let content_resolver = env
        .call_method(
            &context,
            "getContentResolver",
            "()Landroid/content/ContentResolver;",
            &[],
        )
        .map_err(|e| format!("JNI: getContentResolver: {e}"))?
        .l()
        .map_err(|e| format!("JNI: getContentResolver returned non-object: {e}"))?;

    // Uri.parse(uri)
    let uri_str = env
        .new_string(uri)
        .map_err(|e| format!("JNI: new_string: {e}"))?;
    let uri_obj = env
        .call_static_method(
            "android/net/Uri",
            "parse",
            "(Ljava/lang/String;)Landroid/net/Uri;",
            &[JValueGen::Object(&uri_str)],
        )
        .map_err(|e| format!("JNI: Uri.parse: {e}"))?
        .l()
        .map_err(|e| format!("JNI: Uri.parse returned non-object: {e}"))?;

    // contentResolver.openFileDescriptor(uri, "w")
    let mode_str = env
        .new_string("w")
        .map_err(|e| format!("JNI: new_string: {e}"))?;
    let parcel_fd = env
        .call_method(
            &content_resolver,
            "openFileDescriptor",
            "(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;",
            &[JValueGen::Object(&uri_obj), JValueGen::Object(&mode_str)],
        )
        .map_err(|e| format!("JNI: openFileDescriptor({uri}): {e}"))?
        .l()
        .map_err(|e| format!("JNI: openFileDescriptor returned non-object: {e}"))?;

    // parcelFd.detachFd()
    let fd = env
        .call_method(&parcel_fd, "detachFd", "()I", &[])
        .map_err(|e| format!("JNI: detachFd: {e}"))?
        .i()
        .map_err(|e| format!("JNI: detachFd returned non-int: {e}"))?;

    if fd < 0 {
        return Err(format!("JNI: detachFd returned invalid fd: {fd}"));
    }

    // SAFETY: detachFd transfers ownership of the fd to us.
    Ok(unsafe { File::from_raw_fd(fd) })
}

// ─── Helpers ────────────────────────────────────────────────────────

/// Obtain the Android Application context via
/// `ActivityThread.currentActivityThread().getApplication()`.
///
/// This works from any thread (not just the main/activity thread).
fn get_application_context<'local>(
    env: &mut JNIEnv<'local>,
) -> Result<jni::objects::JObject<'local>, String> {
    let activity_thread_class = env
        .find_class("android/app/ActivityThread")
        .map_err(|e| format!("JNI: find ActivityThread: {e}"))?;

    let current_at = env
        .call_static_method(
            &activity_thread_class,
            "currentActivityThread",
            "()Landroid/app/ActivityThread;",
            &[],
        )
        .map_err(|e| format!("JNI: currentActivityThread: {e}"))?
        .l()
        .map_err(|e| format!("JNI: currentActivityThread non-object: {e}"))?;

    let app = env
        .call_method(
            &current_at,
            "getApplication",
            "()Landroid/app/Application;",
            &[],
        )
        .map_err(|e| format!("JNI: getApplication: {e}"))?
        .l()
        .map_err(|e| format!("JNI: getApplication non-object: {e}"))?;

    Ok(app)
}
