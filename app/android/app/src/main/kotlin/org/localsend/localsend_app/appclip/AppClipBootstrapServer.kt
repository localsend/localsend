package org.localsend.localsend_app.appclip

import java.io.BufferedInputStream
import java.io.Closeable
import java.io.IOException
import java.net.Inet4Address
import java.net.InetAddress
import java.net.InetSocketAddress
import java.net.ServerSocket
import java.net.Socket
import java.nio.charset.StandardCharsets
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

internal data class AppClipBootstrapResult(
    val sessionId: String,
    val peerIp: String,
    val peerPort: Int,
    val downloadToken: String,
) {
    fun toMap(): Map<String, Any> = mapOf(
        "sessionId" to sessionId,
        "peerIp" to peerIp,
        "peerPort" to peerPort,
        "downloadToken" to downloadToken,
    )
}

/** Bounded one-shot HTTP bootstrap listener; it never receives or persists transfer bytes. */
internal class AppClipBootstrapServer(
    private val sessionId: ByteArray,
    private val sessionKey: ByteArray,
    private val clock: () -> Long = System::currentTimeMillis,
    private val onAccepted: (AppClipBootstrapResult) -> Unit,
    private val onFatalError: () -> Unit,
) : Closeable {
    private val closed = AtomicBoolean(false)
    private val accepted = AtomicReference<AppClipBootstrapResult?>(null)
    private val socket = ServerSocket().apply {
        reuseAddress = false
        bind(InetSocketAddress(InetAddress.getByName("0.0.0.0"), 0), 4)
    }
    private val worker = Executors.newSingleThreadExecutor { runnable ->
        Thread(runnable, "localsend-app-clip-bootstrap").apply { isDaemon = true }
    }

    val port: Int = socket.localPort

    init {
        worker.execute(::acceptLoop)
    }

    fun result(): AppClipBootstrapResult? = accepted.get()

    private fun acceptLoop() {
        while (!closed.get()) {
            try {
                socket.accept().use(::handle)
            } catch (_: IOException) {
                if (!closed.get()) onFatalError()
                return
            } catch (_: RuntimeException) {
                if (!closed.get()) onFatalError()
                return
            }
        }
    }

    private fun handle(client: Socket) {
        client.soTimeout = 5_000
        if (accepted.get() != null) {
            respond(client, 409, "Conflict")
            return
        }
        try {
            val body = readRequest(client)
            val remote = client.inetAddress
            val peerIp = remote.hostAddress ?: throw HttpFailure(400, "Bad Request")
            if (remote !is Inet4Address || !AppClipProtocol.isCanonicalPrivateIpv4(peerIp)) {
                throw HttpFailure(403, "Forbidden")
            }
            val bootstrap = try {
                AppClipProtocol.authenticateBootstrap(body, sessionId, sessionKey, clock())
            } catch (error: BootstrapException) {
                when (error.failure) {
                    BootstrapFailure.INVALID_SHAPE -> throw HttpFailure(400, "Bad Request")
                    BootstrapFailure.AUTHENTICATION -> throw HttpFailure(403, "Forbidden")
                }
            }
            val result = AppClipBootstrapResult(
                sessionId = AppClipProtocol.encodeSessionId(sessionId),
                peerIp = peerIp,
                peerPort = bootstrap.listenerPort,
                downloadToken = AppClipProtocol.deriveDownloadToken(sessionKey),
            )
            if (!accepted.compareAndSet(null, result)) {
                throw HttpFailure(409, "Conflict")
            }
            respond(client, 202, "Accepted")
            onAccepted(result)
        } catch (failure: HttpFailure) {
            respond(client, failure.status, failure.reason)
        } catch (_: IOException) {
            // A disconnected or malformed client has no effect on the active one-shot listener.
        }
    }

    private fun readRequest(client: Socket): ByteArray {
        val input = BufferedInputStream(client.getInputStream())
        var headerBytes = 0
        fun line(): String {
            val bytes = ArrayList<Byte>()
            while (true) {
                val next = input.read()
                if (next < 0) throw HttpFailure(400, "Bad Request")
                headerBytes++
                if (headerBytes > MAX_HEADER_BYTES) throw HttpFailure(400, "Bad Request")
                if (next == '\r'.code) {
                    if (input.read() != '\n'.code) throw HttpFailure(400, "Bad Request")
                    headerBytes++
                    return bytes.toByteArray().toString(StandardCharsets.US_ASCII)
                }
                if (next == '\n'.code || next > 0x7f) throw HttpFailure(400, "Bad Request")
                bytes.add(next.toByte())
            }
        }

        if (line() != "POST $APP_CLIP_BOOTSTRAP_PATH HTTP/1.1") throw HttpFailure(400, "Bad Request")
        val headers = mutableMapOf<String, String>()
        while (true) {
            val value = line()
            if (value.isEmpty()) break
            val separator = value.indexOf(':')
            if (separator <= 0) throw HttpFailure(400, "Bad Request")
            val name = value.substring(0, separator).trim().lowercase()
            if (headers.put(name, value.substring(separator + 1).trim()) != null) throw HttpFailure(400, "Bad Request")
        }
        if (headers["content-type"] != "application/octet-stream") throw HttpFailure(400, "Bad Request")
        if (headers["transfer-encoding"] != null) throw HttpFailure(400, "Bad Request")
        if (headers["content-length"]?.toIntOrNull() != APP_CLIP_BOOTSTRAP_SIZE) throw HttpFailure(400, "Bad Request")

        val body = ByteArray(APP_CLIP_BOOTSTRAP_SIZE)
        var offset = 0
        while (offset < body.size) {
            val count = input.read(body, offset, body.size - offset)
            if (count < 0) throw HttpFailure(400, "Bad Request")
            offset += count
        }
        return body
    }

    private fun respond(client: Socket, status: Int, reason: String) {
        try {
            client.getOutputStream().write(
                "HTTP/1.1 $status $reason\r\nContent-Length: 0\r\nConnection: close\r\n\r\n"
                    .toByteArray(StandardCharsets.US_ASCII),
            )
            client.getOutputStream().flush()
        } catch (_: IOException) {
            // The state transition remains valid even if the client closes before reading the response.
        }
    }

    override fun close() {
        if (!closed.compareAndSet(false, true)) return
        try {
            socket.close()
        } catch (_: IOException) {
            // Already closed.
        }
        worker.shutdownNow()
    }

    private class HttpFailure(val status: Int, val reason: String) : Exception()

    companion object {
        private const val MAX_HEADER_BYTES = 4_096
    }
}
