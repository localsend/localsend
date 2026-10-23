//! Limits on the connections being served, in total and per peer.

use std::collections::HashMap;
use std::net::IpAddr;
use std::sync::{Arc, Mutex};

/// How many connections are served at once. Protects the descriptors of the
/// process (which the application shares) against many peers together.
pub(crate) const MAX_CONNECTIONS: usize = 64;

/// How many connections a single peer may hold, so that one peer cannot take
/// every slot. Real peers use a few: a sender uploads two files in parallel
/// and browsers open up to six connections per host.
pub(crate) const MAX_CONNECTIONS_PER_IP: usize = 8;

#[derive(Debug, PartialEq, Eq)]
pub(crate) enum LimitReached {
    Total,
    PerIp,
}

pub(crate) struct ConnectionLimiter {
    max_total: usize,
    max_per_ip: usize,
    counts: Mutex<Counts>,
}

#[derive(Default)]
struct Counts {
    total: usize,
    per_ip: HashMap<IpAddr, usize>,
}

impl ConnectionLimiter {
    pub(crate) fn new(max_total: usize, max_per_ip: usize) -> Arc<Self> {
        Arc::new(Self {
            max_total,
            max_per_ip,
            counts: Mutex::new(Counts::default()),
        })
    }

    /// Reserves a slot for a connection from `ip`, released when the permit is dropped.
    ///
    /// Loopback peers only count towards the total: they are on this device
    /// anyway, and tests and tools connect from there many times at once.
    pub(crate) fn try_acquire(
        self: &Arc<Self>,
        ip: IpAddr,
    ) -> Result<ConnectionPermit, LimitReached> {
        let ip = ip.to_canonical();
        let ip = (!ip.is_loopback()).then_some(ip);

        let mut counts = self.counts.lock().unwrap();
        if counts.total >= self.max_total {
            return Err(LimitReached::Total);
        }
        if let Some(ip) = ip {
            let count = counts.per_ip.entry(ip).or_default();
            if *count >= self.max_per_ip {
                return Err(LimitReached::PerIp);
            }
            *count += 1;
        }
        counts.total += 1;

        Ok(ConnectionPermit {
            limiter: self.clone(),
            ip,
        })
    }

    #[cfg(test)]
    pub(crate) fn total(&self) -> usize {
        self.counts.lock().unwrap().total
    }
}

pub(crate) struct ConnectionPermit {
    limiter: Arc<ConnectionLimiter>,

    /// `None` when the connection is not limited per peer.
    ip: Option<IpAddr>,
}

impl Drop for ConnectionPermit {
    fn drop(&mut self) {
        let mut counts = self.limiter.counts.lock().unwrap();
        counts.total -= 1;
        if let Some(ip) = self.ip {
            if let Some(count) = counts.per_ip.get_mut(&ip) {
                *count -= 1;
                if *count == 0 {
                    counts.per_ip.remove(&ip);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ip(s: &str) -> IpAddr {
        s.parse().unwrap()
    }

    #[test]
    fn limits_connections_per_ip() {
        let limiter = ConnectionLimiter::new(10, 2);
        let _a1 = limiter.try_acquire(ip("192.168.1.2")).unwrap();
        let a2 = limiter.try_acquire(ip("192.168.1.2")).unwrap();
        assert_eq!(
            limiter.try_acquire(ip("192.168.1.2")).err(),
            Some(LimitReached::PerIp)
        );

        // Other peers are not affected.
        let _b = limiter.try_acquire(ip("192.168.1.3")).unwrap();

        // A closed connection frees its slot.
        drop(a2);
        let _a3 = limiter.try_acquire(ip("192.168.1.2")).unwrap();
    }

    #[test]
    fn ipv4_mapped_addresses_count_as_the_ipv4_peer() {
        let limiter = ConnectionLimiter::new(10, 1);
        let _a = limiter.try_acquire(ip("192.168.1.2")).unwrap();
        assert_eq!(
            limiter.try_acquire(ip("::ffff:192.168.1.2")).err(),
            Some(LimitReached::PerIp)
        );
    }

    #[test]
    fn limits_connections_in_total() {
        let limiter = ConnectionLimiter::new(2, 2);
        let a = limiter.try_acquire(ip("192.168.1.2")).unwrap();
        let _b = limiter.try_acquire(ip("fe80::1")).unwrap();
        assert_eq!(
            limiter.try_acquire(ip("192.168.1.4")).err(),
            Some(LimitReached::Total)
        );

        drop(a);
        let _c = limiter.try_acquire(ip("192.168.1.4")).unwrap();
        assert_eq!(limiter.total(), 2);
    }

    #[test]
    fn loopback_peers_only_count_towards_the_total() {
        let limiter = ConnectionLimiter::new(3, 1);
        let permits: Vec<_> = ["127.0.0.1", "127.0.0.1", "::1"]
            .into_iter()
            .map(|peer| limiter.try_acquire(ip(peer)).unwrap())
            .collect();
        assert_eq!(
            limiter.try_acquire(ip("127.0.0.1")).err(),
            Some(LimitReached::Total)
        );

        drop(permits);
        assert_eq!(limiter.total(), 0);
        assert!(limiter.counts.lock().unwrap().per_ip.is_empty());
    }
}
