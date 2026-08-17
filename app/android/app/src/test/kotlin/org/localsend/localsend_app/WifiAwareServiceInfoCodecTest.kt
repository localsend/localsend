package org.localsend.localsend_app

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class WifiAwareServiceInfoCodecTest {
    @Test
    fun roundTripsServiceInfo() {
        val info = WifiAwareServiceInfo(port = 53317, https = true, passphrase = "12345678abcdefgh")

        assertEquals(info, WifiAwareServiceInfoCodec.decode(WifiAwareServiceInfoCodec.encode(info)))
    }

    @Test
    fun rejectsMalformedOrUnsafeServiceInfo() {
        assertNull(WifiAwareServiceInfoCodec.decode("2|53317|1|12345678".toByteArray()))
        assertNull(WifiAwareServiceInfoCodec.decode("1|0|1|12345678".toByteArray()))
        assertNull(WifiAwareServiceInfoCodec.decode("1|53317|2|12345678".toByteArray()))
        assertNull(WifiAwareServiceInfoCodec.decode("1|53317|1|short".toByteArray()))
    }
}
