use std::env;
use std::io::{Read, Write};
use std::sync::Arc;
use std::sync::atomic::{AtomicI32, Ordering};
use anyhow::Result;
use base64::Engine;
use flate2::Compression;
use flate2::write::ZlibEncoder;
use tokio::sync::Mutex;
use tokio::time::Duration;
use webrtc::api::interceptor_registry::register_default_interceptors;
use webrtc::api::media_engine::MediaEngine;
use webrtc::api::APIBuilder;
use webrtc::data_channel::data_channel_message::DataChannelMessage;
use webrtc::data_channel::RTCDataChannel;
use webrtc::ice_transport::ice_server::RTCIceServer;
use webrtc::interceptor::registry::Registry;
use webrtc::peer_connection::configuration::RTCConfiguration;
use webrtc::peer_connection::math_rand_alpha;
use webrtc::peer_connection::peer_connection_state::RTCPeerConnectionState;
use webrtc::peer_connection::sdp::session_description::RTCSessionDescription;

#[tokio::main]
async fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("usage: {} offer|answer", args[0]);
        return Ok(());
    }

    match &args[1] {
        s if s == "offer" => offer().await?,
        s if s == "answer" => answer().await?,
        _ => println!("usage: {} offer|answer", args[0]),
    }

    Ok(())
}

async fn offer() -> Result<()> {
    let mut m = MediaEngine::default();

    // Register default codecs
    m.register_default_codecs()?;

    // Create a InterceptorRegistry. This is the user configurable RTP/RTCP Pipeline.
    // This provides NACKs, RTCP Reports and other features. If you use `webrtc.NewPeerConnection`
    // this is enabled by default. If you are manually managing You MUST create a InterceptorRegistry
    // for each PeerConnection.
    let mut registry = Registry::new();

    // Use the default set of Interceptors
    registry = register_default_interceptors(registry, &mut m)?;

    // Create the API object with the MediaEngine
    let api = APIBuilder::new()
        .with_media_engine(m)
        .with_interceptor_registry(registry)
        .build();

    // Prepare the configuration
    let config = RTCConfiguration {
        ice_servers: vec![RTCIceServer {
            urls: vec!["stun:stun.l.google.com:19302".to_owned()],
            ..Default::default()
        }],
        ..Default::default()
    };

    // Create a new RTCPeerConnection
    let peer_connection = Arc::new(api.new_peer_connection(config).await?);

    // Create a datachannel with label 'data'
    let data_channel = peer_connection.create_data_channel("data", None).await?;

    let (done_tx, mut done_rx) = tokio::sync::mpsc::channel::<()>(1);

    // Set the handler for Peer connection state
    // This will notify you when the peer has connected/disconnected
    peer_connection.on_peer_connection_state_change(Box::new(move |s: RTCPeerConnectionState| {
        println!("Peer Connection State has changed: {s}");

        if s == RTCPeerConnectionState::Failed {
            // Wait until PeerConnection has had no network activity for 30 seconds or another failure. It may be reconnected using an ICE Restart.
            // Use webrtc.PeerConnectionStateDisconnected if you are interested in detecting faster timeout.
            // Note that the PeerConnection may come back from PeerConnectionStateDisconnected.
            println!("Peer Connection has gone to failed exiting");
            let _ = done_tx.try_send(());
        }

        Box::pin(async {})
    }));

    // Register channel opening handling
    let d1 = Arc::clone(&data_channel);
    data_channel.on_open(Box::new(move || {
        println!("Data channel '{}'-'{}' open. Random messages will now be sent to any connected DataChannels every 5 seconds", d1.label(), d1.id());

        let d2 = Arc::clone(&d1);
        Box::pin(async move {
            let mut result = Result::<usize>::Ok(0);
            while result.is_ok() {
                let timeout = tokio::time::sleep(Duration::from_secs(5));
                tokio::pin!(timeout);

                tokio::select! {
                    _ = timeout.as_mut() =>{
                        let message = math_rand_alpha(15);
                        println!("Sending '{message}'");
                        result = d2.send_text(message).await.map_err(Into::into);
                    }
                };
            }
        })
    }));

    // Register text message handling
    let d_label = data_channel.label().to_owned();
    data_channel.on_message(Box::new(move |msg: DataChannelMessage| {
        let msg_str = String::from_utf8(msg.data.to_vec()).unwrap();
        println!("Message from DataChannel '{d_label}': '{msg_str}'");
        Box::pin(async {})
    }));

    // Create an offer to send to the browser
    let offer = peer_connection.create_offer(None).await?;

    // Create channel that is blocked until ICE Gathering is complete
    let mut gather_complete = peer_connection.gathering_complete_promise().await;

    // Sets the LocalDescription, and starts our UDP listeners
    peer_connection.set_local_description(offer).await?;

    // Block until ICE Gathering is complete, disabling trickle ICE
    // we do this because we only can exchange one signaling message
    // in a production application you should exchange ICE Candidates via OnICECandidate
    let _ = gather_complete.recv().await;

    // Output the answer in base64 so we can paste it in browser
    if let Some(local_desc) = peer_connection.local_description().await {
        let json_str = serde_json::to_string(&local_desc)?;
        println!("LC: {json_str}");
        let b64 = encode(&json_str);
        println!("LC (base64): {b64}");
    } else {
        println!("generate local_description failed!");
    }

    // Wait for the answer to be pasted
    let line = must_read_stdin()?;
    let desc_data = decode(line.as_str())?;
    let answer = serde_json::from_str::<RTCSessionDescription>(&desc_data)?;

    // Apply the answer as the remote description
    peer_connection.set_remote_description(answer).await?;

    println!("Press ctrl-c to stop");
    tokio::select! {
        _ = done_rx.recv() => {
            println!("received done signal!");
        }
        _ = tokio::signal::ctrl_c() => {
            println!();
        }
    }

    peer_connection.close().await?;

    Ok(())
}

async fn answer() -> Result<()> {
    // Create a MediaEngine object to configure the supported codec
    let mut m = MediaEngine::default();

    // Register default codecs
    m.register_default_codecs()?;

    // Create a InterceptorRegistry. This is the user configurable RTP/RTCP Pipeline.
    // This provides NACKs, RTCP Reports and other features. If you use `webrtc.NewPeerConnection`
    // this is enabled by default. If you are manually managing You MUST create a InterceptorRegistry
    // for each PeerConnection.
    let mut registry = Registry::new();

    // Use the default set of Interceptors
    registry = register_default_interceptors(registry, &mut m)?;

    // Create the API object with the MediaEngine
    let api = APIBuilder::new()
        .with_media_engine(m)
        .with_interceptor_registry(registry)
        .build();

    // Prepare the configuration
    let config = RTCConfiguration {
        ice_servers: vec![RTCIceServer {
            urls: vec!["stun:stun.l.google.com:19302".to_owned()],
            ..Default::default()
        }],
        ..Default::default()
    };

    // Create a new RTCPeerConnection
    let peer_connection = Arc::new(api.new_peer_connection(config).await?);

    let (done_tx, mut done_rx) = tokio::sync::mpsc::channel::<()>(1);

    // Set the handler for Peer connection state
    // This will notify you when the peer has connected/disconnected
    peer_connection.on_peer_connection_state_change(Box::new(move |s: RTCPeerConnectionState| {
        println!("Peer Connection State has changed: {s}");

        if s == RTCPeerConnectionState::Failed {
            // Wait until PeerConnection has had no network activity for 30 seconds or another failure. It may be reconnected using an ICE Restart.
            // Use webrtc.PeerConnectionStateDisconnected if you are interested in detecting faster timeout.
            // Note that the PeerConnection may come back from PeerConnectionStateDisconnected.
            println!("Peer Connection has gone to failed exiting");
            let _ = done_tx.try_send(());
        }

        Box::pin(async {})
    }));

    let close_after = Arc::new(AtomicI32::new(32));

    // Register data channel creation handling
    peer_connection
        .on_data_channel(Box::new(move |d: Arc<RTCDataChannel>| {
            let d_label = d.label().to_owned();
            let d_id = d.id();
            println!("New DataChannel {d_label} {d_id}");

            let close_after2 = Arc::clone(&close_after);

            // Register channel opening handling
            Box::pin(async move {
                let d2 = Arc::clone(&d);
                let d_label2 = d_label.clone();
                let d_id2 = d_id;
                d.on_open(Box::new(move || {
                    println!("Data channel '{d_label2}'-'{d_id2}' open. Random messages will now be sent to any connected DataChannels every 5 seconds");
                    let (done_tx, mut done_rx) = tokio::sync::mpsc::channel::<()>(1);
                    let done_tx = Arc::new(Mutex::new(Some(done_tx)));
                    Box::pin(async move {
                        d2.on_close(Box::new(move || {
                            println!("Data channel '{d_label2}'-'{d_id2}' closed.");
                            let done_tx2 = Arc::clone(&done_tx);
                            Box::pin(async move{
                                let mut done = done_tx2.lock().await;
                                done.take();
                            })
                        }));

                        let mut result = Result::<usize>::Ok(0);
                        while result.is_ok() {
                            let timeout = tokio::time::sleep(Duration::from_secs(5));
                            tokio::pin!(timeout);

                            tokio::select! {
                                _ = done_rx.recv() => {
                                    break;
                                }
                                _ = timeout.as_mut() =>{
                                    let message = math_rand_alpha(15);
                                    println!("Sending '{message}'");
                                    result = d2.send_text(message).await.map_err(Into::into);

                                    let cnt = close_after2.fetch_sub(1, Ordering::SeqCst);
                                    if cnt <= 0 {
                                        println!("Sent times out. Closing data channel '{}'-'{}'.", d2.label(), d2.id());
                                        let _ = d2.close().await;
                                        break;
                                    }
                                }
                            };
                        }
                    })
                }));

                // Register text message handling
                d.on_message(Box::new(move |msg: DataChannelMessage| {
                    let msg_str = String::from_utf8(msg.data.to_vec()).unwrap();
                    println!("Message from DataChannel '{d_label}': '{msg_str}'");
                    Box::pin(async {})
                }));
            })
        }));

    // Wait for the offer to be pasted
    let line = must_read_stdin()?;
    let desc_data = decode(line.as_str())?;
    let offer = serde_json::from_str::<RTCSessionDescription>(&desc_data)?;

    // Set the remote SessionDescription
    peer_connection.set_remote_description(offer).await?;

    // Create an answer
    let answer = peer_connection.create_answer(None).await?;

    // Create channel that is blocked until ICE Gathering is complete
    let mut gather_complete = peer_connection.gathering_complete_promise().await;

    // Sets the LocalDescription, and starts our UDP listeners
    peer_connection.set_local_description(answer).await?;

    // Block until ICE Gathering is complete, disabling trickle ICE
    // we do this because we only can exchange one signaling message
    // in a production application you should exchange ICE Candidates via OnICECandidate
    let _ = gather_complete.recv().await;

    // Output the answer in base64 so we can paste it in browser
    if let Some(local_desc) = peer_connection.local_description().await {
        let json_str = serde_json::to_string(&local_desc)?;
        let b64 = encode(&json_str);
        println!("{b64}");
    } else {
        println!("generate local_description failed!");
    }

    println!("Press ctrl-c to stop");
    tokio::select! {
        _ = done_rx.recv() => {
            println!("received done signal!");
        }
        _ = tokio::signal::ctrl_c() => {
            println!();
        }
    };

    peer_connection.close().await?;

    Ok(())
}

fn encode(s: &str) -> String {
    let mut e = ZlibEncoder::new(Vec::new(), Compression::default());
    e.write_all(s.as_bytes()).unwrap();
    let compressed_data = e.finish().unwrap();
    base64::engine::general_purpose::STANDARD.encode(compressed_data)
}

fn decode(s: &str) -> Result<String> {
    let decoded_data = base64::engine::general_purpose::STANDARD.decode(s)?;
    let mut d = flate2::bufread::ZlibDecoder::new(&decoded_data[..]);
    let mut s = String::new();
    d.read_to_string(&mut s)?;
    Ok(s)
}

fn must_read_stdin() -> Result<String> {
    let mut line = String::new();
    std::io::stdin().read_line(&mut line)?;
    line = line.trim().to_owned();
    println!("read from stdin: {line}");
    Ok(line)
}
