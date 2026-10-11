use flutter_rust_bridge::frb;

pub struct RsCancellationToken {
    pub(crate) inner: tokio_util::sync::CancellationToken,
}

#[frb(sync)]
pub fn create_cancellation_token() -> RsCancellationToken {
    RsCancellationToken {
        inner: tokio_util::sync::CancellationToken::new(),
    }
}

impl RsCancellationToken {
    #[frb(sync)]
    pub fn cancel(&self) {
        self.inner.cancel();
    }
}
