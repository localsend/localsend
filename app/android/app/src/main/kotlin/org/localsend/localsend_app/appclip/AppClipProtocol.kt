package org.localsend.localsend_app.appclip

import java.net.URI
import java.net.URLEncoder
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import java.util.Base64
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec

internal const val APP_CLIP_BOOTSTRAP_PATH = "/api/localsend/app-clip/v1/bootstrap"
internal const val APP_CLIP_BOOTSTRAP_SIZE = 75
private const val APP_CLIP_INVOCATION_MAX_BYTES = 1_024
private const val APP_CLIP_BOOTSTRAP_TTL_MILLIS = 120_000L
private const val DOWNLOAD_TOKEN_LABEL = "localsend-app-clip-download-v1"

/** Builds and authenticates the short-lived values shared by the Android host and App Clip. */
internal object AppClipProtocol {
    fun validateInvocationBaseUrl(baseUrl: String) {
        val base = URI(baseUrl)
        require(base.scheme == "https" && base.host != null) { "App Clip URL must use HTTPS" }
        require(base.userInfo == null && base.query == null && base.fragment == null) { "App Clip URL must not contain credentials, query, or fragment" }
        require(base.port == -1 || base.port == 443) { "App Clip URL must use the default HTTPS port" }
    }

    fun buildInvocationUrl(
        baseUrl: String,
        sessionId: ByteArray,
        sessionKey: ByteArray,
        ssid: String,
        passphrase: String,
        hosts: List<String>,
        bootstrapPort: Int,
        deviceName: String,
    ): String {
        require(sessionId.size == 16) { "Session ID must be 16 bytes" }
        require(sessionKey.size == 32) { "Session key must be 32 bytes" }
        require(ssid.toByteArray(StandardCharsets.UTF_8).size in 1..32) { "Invalid hotspot SSID" }
        require(passphrase.toByteArray(StandardCharsets.UTF_8).size in 8..63) { "Invalid hotspot passphrase" }
        require(hosts.isNotEmpty() && hosts.size <= 4 && hosts.distinct().size == hosts.size) { "Invalid host list" }
        require(hosts.all(::isCanonicalPrivateIpv4)) { "Host list must contain canonical private IPv4 addresses" }
        require(bootstrapPort in 1..65_535) { "Invalid bootstrap port" }
        require(deviceName.toByteArray(StandardCharsets.UTF_8).size in 1..80) { "Invalid device name" }

        validateInvocationBaseUrl(baseUrl)
        val base = URI(baseUrl)

        val query = listOf(
            "v" to "1",
            "sid" to base64Url(sessionId),
            "k" to base64Url(sessionKey),
            "ssid" to ssid,
            "pass" to passphrase,
            "hosts" to hosts.joinToString(","),
            "bp" to bootstrapPort.toString(),
            "name" to deviceName,
        ).joinToString("&") { (key, value) -> "$key=${encodeQueryValue(value)}" }
        val invocation = "${base.toASCIIString()}?$query"
        require(invocation.toByteArray(StandardCharsets.UTF_8).size <= APP_CLIP_INVOCATION_MAX_BYTES) { "App Clip URL is too long" }
        return invocation
    }

    fun authenticateBootstrap(
        body: ByteArray,
        expectedSessionId: ByteArray,
        sessionKey: ByteArray,
        nowMillis: Long,
    ): AuthenticatedBootstrap {
        if (body.size != APP_CLIP_BOOTSTRAP_SIZE || expectedSessionId.size != 16 || sessionKey.size != 32) {
            throw BootstrapException(BootstrapFailure.INVALID_SHAPE)
        }
        if (body[0] != 1.toByte()) {
            throw BootstrapException(BootstrapFailure.INVALID_SHAPE)
        }

        val sessionId = body.copyOfRange(1, 17)
        if (!MessageDigest.isEqual(sessionId, expectedSessionId)) {
            throw BootstrapException(BootstrapFailure.AUTHENTICATION)
        }
        val signed = body.copyOfRange(0, 43)
        val suppliedMac = body.copyOfRange(43, APP_CLIP_BOOTSTRAP_SIZE)
        if (!MessageDigest.isEqual(hmacSha256(sessionKey, signed), suppliedMac)) {
            throw BootstrapException(BootstrapFailure.AUTHENTICATION)
        }

        val values = ByteBuffer.wrap(body).order(ByteOrder.BIG_ENDIAN)
        values.position(17)
        val listenerPort = values.short.toInt() and 0xffff
        val issuedAtMillis = values.long
        val nonce = ByteArray(16).also(values::get)
        if (listenerPort == 0 || issuedAtMillis < nowMillis - APP_CLIP_BOOTSTRAP_TTL_MILLIS || issuedAtMillis > nowMillis + APP_CLIP_BOOTSTRAP_TTL_MILLIS) {
            throw BootstrapException(BootstrapFailure.INVALID_SHAPE)
        }
        return AuthenticatedBootstrap(listenerPort, issuedAtMillis, nonce)
    }

    fun deriveDownloadToken(sessionKey: ByteArray): String {
        require(sessionKey.size == 32) { "Session key must be 32 bytes" }
        return base64Url(hmacSha256(sessionKey, DOWNLOAD_TOKEN_LABEL.toByteArray(StandardCharsets.US_ASCII)))
    }

    fun encodeSessionId(sessionId: ByteArray): String {
        require(sessionId.size == 16) { "Session ID must be 16 bytes" }
        return base64Url(sessionId)
    }

    fun isCanonicalPrivateIpv4(value: String): Boolean {
        val parts = value.split('.')
        if (parts.size != 4) return false
        val octets = IntArray(4)
        for (index in parts.indices) {
            val part = parts[index]
            if (part.isEmpty() || (part.length > 1 && part.startsWith('0')) || part.any { !it.isDigit() }) return false
            val octet = part.toIntOrNull() ?: return false
            if (octet !in 0..255) return false
            octets[index] = octet
        }
        return octets[0] == 10 ||
            (octets[0] == 172 && octets[1] in 16..31) ||
            (octets[0] == 192 && octets[1] == 168)
    }

    private fun hmacSha256(key: ByteArray, value: ByteArray): ByteArray =
        Mac.getInstance("HmacSHA256").run {
            init(SecretKeySpec(key, "HmacSHA256"))
            doFinal(value)
        }

    private fun base64Url(value: ByteArray): String = Base64.getUrlEncoder().withoutPadding().encodeToString(value)

    private fun encodeQueryValue(value: String): String =
        URLEncoder.encode(value, StandardCharsets.UTF_8.name()).replace("+", "%20")
}

internal data class AuthenticatedBootstrap(
    val listenerPort: Int,
    val issuedAtMillis: Long,
    val nonce: ByteArray,
)

internal enum class BootstrapFailure {
    INVALID_SHAPE,
    AUTHENTICATION,
}

internal class BootstrapException(val failure: BootstrapFailure) : IllegalArgumentException(failure.name)
