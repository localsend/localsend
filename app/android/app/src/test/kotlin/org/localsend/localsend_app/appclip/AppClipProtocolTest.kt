package org.localsend.localsend_app.appclip

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.ByteBuffer
import java.nio.ByteOrder

class AppClipProtocolTest {
    private val sessionId = ByteArray(16) { it.toByte() }
    private val sessionKey = ByteArray(32) { it.toByte() }

    @Test
    fun invocationRoundTripsContractValues() {
        val url = AppClipProtocol.buildInvocationUrl(
            baseUrl = "https://localsend.org/clip",
            sessionId = sessionId,
            sessionKey = sessionKey,
            ssid = "Local Send & Café",
            passphrase = "a/b+c d?",
            hosts = listOf("192.168.43.1", "172.20.10.1"),
            bootstrapPort = 45_321,
            deviceName = "Pixel 9 Pro",
        )

        assertTrue(url.startsWith("https://localsend.org/clip?v=1&"))
        assertTrue(url.contains("ssid=Local%20Send%20%26%20Caf%C3%A9"))
        assertTrue(url.contains("pass=a%2Fb%2Bc%20d%3F"))
        assertTrue(url.contains("hosts=192.168.43.1%2C172.20.10.1"))
        assertFalse(url.contains("+"))
    }

    @Test
    fun rejectsUnsafeInvocationInputs() {
        assertThrows(IllegalArgumentException::class.java) {
            AppClipProtocol.buildInvocationUrl("http://localsend.org/clip", sessionId, sessionKey, "ssid", "12345678", listOf("192.168.1.1"), 8080, "Pixel")
        }
        assertThrows(IllegalArgumentException::class.java) {
            AppClipProtocol.buildInvocationUrl("https://localsend.org/clip", sessionId, sessionKey, "ssid", "12345678", listOf("010.0.0.1"), 8080, "Pixel")
        }
        assertFalse(AppClipProtocol.isCanonicalPrivateIpv4("127.0.0.1"))
        assertFalse(AppClipProtocol.isCanonicalPrivateIpv4("192.168.001.1"))
        assertTrue(AppClipProtocol.isCanonicalPrivateIpv4("10.0.0.1"))
    }

    @Test
    fun authenticatesIndependentBootstrapVector() {
        val body = hex(
            "01000102030405060708090a0b0c0d0e0f1f900000018bcfe56800" +
                "a0a1a2a3a4a5a6a7a8a9aaabacadaeaf" +
                "268b9b48e5b2564018c313fe6e41d2cb2ea801bd9b95fcc4a415f234b8d1db3c",
        )

        val result = AppClipProtocol.authenticateBootstrap(body, sessionId, sessionKey, 1_700_000_000_000L)

        assertEquals(8080, result.listenerPort)
        assertEquals(1_700_000_000_000L, result.issuedAtMillis)
        assertArrayEquals(ByteArray(16) { (0xa0 + it).toByte() }, result.nonce)
        assertEquals("pk1G7b8k5hTIZy-kMRJmCLYFNGHb0FdNQhB0DT_o7Pw", AppClipProtocol.deriveDownloadToken(sessionKey))
    }

    @Test
    fun rejectsTamperingAndExpiredBodies() {
        val valid = bootstrapBody(1_700_000_000_000L)
        val tampered = valid.copyOf().also { it[20] = (it[20].toInt() xor 1).toByte() }
        assertEquals(
            BootstrapFailure.AUTHENTICATION,
            assertThrows(BootstrapException::class.java) {
                AppClipProtocol.authenticateBootstrap(tampered, sessionId, sessionKey, 1_700_000_000_000L)
            }.failure,
        )
        assertEquals(
            BootstrapFailure.INVALID_SHAPE,
            assertThrows(BootstrapException::class.java) {
                AppClipProtocol.authenticateBootstrap(valid, sessionId, sessionKey, 1_700_000_120_001L)
            }.failure,
        )
    }

    private fun bootstrapBody(issuedAt: Long): ByteArray {
        val fixed = hex(
            "01000102030405060708090a0b0c0d0e0f1f90" +
                ByteBuffer.allocate(8).order(ByteOrder.BIG_ENDIAN).putLong(issuedAt).array().toHex() +
                "a0a1a2a3a4a5a6a7a8a9aaabacadaeaf",
        )
        val mac = javax.crypto.Mac.getInstance("HmacSHA256").run {
            init(javax.crypto.spec.SecretKeySpec(sessionKey, "HmacSHA256"))
            doFinal(fixed)
        }
        return fixed + mac
    }

    private fun hex(value: String): ByteArray = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
    private fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }
}
