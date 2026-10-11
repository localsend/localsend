use flutter_rust_bridge::frb;
use localsend::util::filename;

/// Rewrites `name` into a file name that is legal on the current platform,
/// replacing illegal characters with `_`.
#[frb(sync)]
pub fn sanitize_file_name(name: String) -> String {
    filename::sanitize(&name, filename::Rules::current())
}

/// Whether `name` is a legal file name on the current platform, i.e. whether
/// [sanitize_file_name] would leave it untouched.
#[frb(sync)]
pub fn is_valid_file_name(name: String) -> bool {
    filename::is_valid(&name, filename::Rules::current())
}
