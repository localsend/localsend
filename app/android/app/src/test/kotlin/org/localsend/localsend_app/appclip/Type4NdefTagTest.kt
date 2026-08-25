package org.localsend.localsend_app.appclip

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertFalse
import org.junit.Test
import java.nio.charset.StandardCharsets

class Type4NdefTagTest {
    @Test
    fun emitsExactlyOneUriRecord() {
        assertArrayEquals(
            hex("001cd10118550068747470733a2f2f6c6f63616c73656e642e6f72672f63"),
            Type4NdefTag.buildNdefFile("https://localsend.org/c"),
        )
    }

    @Test
    fun servesCapabilityContainerAndChunkedNdefReads() {
        val tag = Type4NdefTag("https://localsend.org/c")
        assertArrayEquals(hex("9000"), tag.process(hex("00a4040007d2760000850101")))
        assertArrayEquals(hex("9000"), tag.process(hex("00a4000c02e103")))
        assertArrayEquals(Type4NdefTag.CAPABILITY_CONTAINER + hex("9000"), tag.process(hex("00b000000f")))
        assertArrayEquals(hex("9000"), tag.process(hex("00a4000c02e104")))
        assertArrayEquals(hex("001cd101189000"), tag.process(hex("00b0000005")))
        assertArrayEquals(hex("5500687474709000"), tag.process(hex("00b0000506")))
    }

    @Test
    fun rejectsMutationUnknownFilesAndInvalidOffsets() {
        val tag = Type4NdefTag("https://localsend.org/c")
        assertArrayEquals(hex("6d00"), tag.process(hex("00d600000100")))
        assertArrayEquals(hex("6a82"), tag.process(hex("00a4000c02e105")))
        assertArrayEquals(hex("6985"), tag.process(hex("00b0000005")))
        assertArrayEquals(hex("9000"), tag.process(hex("00a4000c02e104")))
        assertArrayEquals(hex("6b00"), tag.process(hex("00b0ffff01")))
    }

    @Test
    fun newTagCannotExposePreviousSession() {
        val first = Type4NdefTag.buildNdefFile("https://localsend.org/c?sid=first")
        val second = Type4NdefTag.buildNdefFile("https://localsend.org/c?sid=second")
        assertFalse(first.contentEquals(second))
        assertFalse(String(second, StandardCharsets.UTF_8).contains("first"))
    }

    private fun hex(value: String): ByteArray = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}
