//! Binding of the UDP sockets that carry the multicast discovery traffic.

use crate::multicast::interface::{local_interfaces, InterfaceFilter};
use socket2::{Domain, Protocol, Socket, Type};
use std::net::{Ipv4Addr, Ipv6Addr, SocketAddr, SocketAddrV4, SocketAddrV6};
use std::sync::Arc;
use tokio::net::UdpSocket;

/// A socket that is joined to the multicast group on a single interface.
pub(crate) struct MulticastSocket {
    /// Describes the interface this socket is bound to, only used for logging.
    pub(crate) description: String,

    /// The group address announcements are sent to through this socket.
    pub(crate) target: SocketAddr,

    pub(crate) socket: Arc<UdpSocket>,
}

/// Binds and joins the multicast groups on every interface that passes
/// `filter`: one IPv4 socket per interface address, and — when `group_v6` is
/// set — one IPv6 socket per interface.
///
/// One socket per interface is required because a socket only sends on a single
/// interface.
///
/// Interfaces that cannot be bound or joined are skipped, so that a single
/// unusable interface (e.g. a virtual adapter) does not disable discovery.
pub(crate) fn bind_multicast_sockets(
    group: Ipv4Addr,
    group_v6: Option<Ipv6Addr>,
    port: u16,
    filter: &InterfaceFilter,
) -> std::io::Result<Vec<MulticastSocket>> {
    let interfaces = local_interfaces(filter)?;

    let mut sockets = Vec::new();
    for interface in interfaces.v4 {
        let description = format!("{} ({})", interface.name, interface.address);
        match bind_multicast_socket_v4(group, port, interface.address) {
            Ok(socket) => {
                tracing::info!(
                    "Bound UDP multicast socket (interface: {description}, group: {group}, port: {port})",
                );
                sockets.push(MulticastSocket {
                    description,
                    target: SocketAddr::from(SocketAddrV4::new(group, port)),
                    socket: Arc::new(socket),
                });
            }
            Err(err) => {
                tracing::warn!(
                    "Could not bind UDP multicast socket (interface: {description}, group: {group}, port: {port}): {err:#}",
                );
            }
        }
    }

    if let Some(group) = group_v6 {
        for interface in interfaces.v6 {
            let description = format!("{} (IPv6, if-index {})", interface.name, interface.index);
            match bind_multicast_socket_v6(group, port, interface.index) {
                Ok(socket) => {
                    tracing::info!(
                        "Bound UDP multicast socket (interface: {description}, group: {group}, port: {port})",
                    );
                    sockets.push(MulticastSocket {
                        description,
                        target: SocketAddr::from(SocketAddrV6::new(
                            group,
                            port,
                            0,
                            interface.index,
                        )),
                        socket: Arc::new(socket),
                    });
                }
                Err(err) => {
                    tracing::warn!(
                        "Could not bind UDP multicast socket (interface: {description}, group: {group}, port: {port}): {err:#}",
                    );
                }
            }
        }
    }

    Ok(sockets)
}

fn bind_multicast_socket_v4(
    group: Ipv4Addr,
    port: u16,
    interface: Ipv4Addr,
) -> std::io::Result<UdpSocket> {
    let socket = Socket::new(Domain::IPV4, Type::DGRAM, Some(Protocol::UDP))?;

    // All sockets share the same port. Windows has no `SO_REUSEPORT`.
    socket.set_reuse_address(true)?;
    #[cfg(all(unix, not(any(target_os = "solaris", target_os = "illumos"))))]
    socket.set_reuse_port(true)?;

    // Binding to the wildcard address instead of the interface address is what
    // makes the socket receive multicast datagrams on platforms that match the
    // destination address against the bound address.
    socket.bind(&SocketAddr::from(SocketAddrV4::new(Ipv4Addr::UNSPECIFIED, port)).into())?;

    socket.join_multicast_v4(&group, &interface)?;

    // Pin outgoing datagrams to this interface, otherwise the routing table
    // decides and every socket would announce on the same one.
    socket.set_multicast_if_v4(&interface)?;

    // Keep loopback enabled so that several instances on the same host can see
    // each other; own messages are filtered out by fingerprint.
    socket.set_multicast_loop_v4(true)?;

    // Discovery is limited to the local subnet.
    socket.set_multicast_ttl_v4(1)?;

    socket.set_nonblocking(true)?;

    UdpSocket::from_std(socket.into())
}

/// Mirrors [`bind_multicast_socket_v4`], but joins the group by interface
/// index instead of by address.
fn bind_multicast_socket_v6(
    group: Ipv6Addr,
    port: u16,
    interface: u32,
) -> std::io::Result<UdpSocket> {
    let socket = Socket::new(Domain::IPV6, Type::DGRAM, Some(Protocol::UDP))?;

    // A dual-stack socket would clash with the IPv4 sockets on the same port.
    socket.set_only_v6(true)?;

    socket.set_reuse_address(true)?;
    #[cfg(all(unix, not(any(target_os = "solaris", target_os = "illumos"))))]
    socket.set_reuse_port(true)?;

    socket.bind(&SocketAddr::from(SocketAddrV6::new(Ipv6Addr::UNSPECIFIED, port, 0, 0)).into())?;

    socket.join_multicast_v6(&group, interface)?;

    socket.set_multicast_if_v6(interface)?;

    socket.set_multicast_loop_v6(true)?;

    // Discovery is limited to the local link (the group's scope already is).
    socket.set_multicast_hops_v6(1)?;

    socket.set_nonblocking(true)?;

    UdpSocket::from_std(socket.into())
}
