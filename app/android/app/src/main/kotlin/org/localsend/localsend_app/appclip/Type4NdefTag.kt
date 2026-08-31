package org.localsend.localsend_app.appclip

import java.io.ByteArrayOutputStream
import java.nio.charset.StandardCharsets

/** In-memory, read-only NFC Forum Type-4 tag containing exactly one HTTPS URI record. */
internal class Type4NdefTag(invocationUrl: String) {
    private enum class SelectedFile { CAPABILITY_CONTAINER, NDEF }

    private var selectedFile: SelectedFile? = null
    private val ndefFile = buildNdefFile(invocationUrl)

    fun process(command: ByteArray): ByteArray {
        if (command.size < 4) return WRONG_LENGTH.copyOf()
        if (command[0] != 0.toByte()) return CLASS_NOT_SUPPORTED.copyOf()
        return when (command[1].toInt() and 0xff) {
            0xA4 -> select(command)
            0xB0 -> readBinary(command)
            else -> INSTRUCTION_NOT_SUPPORTED.copyOf()
        }
    }

    fun reset() {
        selectedFile = null
    }

    private fun select(command: ByteArray): ByteArray {
        return when (command[2].toInt() and 0xff) {
            0x04 -> {
                if (!isSelectByName(command, NDEF_APPLICATION_AID)) return FILE_NOT_FOUND.copyOf()
                selectedFile = null
                OK.copyOf()
            }
            0x00 -> {
                if (command.size != 7 || (command[3] != 0.toByte() && command[3] != 0x0c.toByte()) || command[4] != 2.toByte()) {
                    return WRONG_LENGTH.copyOf()
                }
                selectedFile = when {
                    command[5] == 0xe1.toByte() && command[6] == 0x03.toByte() -> SelectedFile.CAPABILITY_CONTAINER
                    command[5] == 0xe1.toByte() && command[6] == 0x04.toByte() -> SelectedFile.NDEF
                    else -> return FILE_NOT_FOUND.copyOf()
                }
                OK.copyOf()
            }
            else -> FILE_NOT_FOUND.copyOf()
        }
    }

    private fun readBinary(command: ByteArray): ByteArray {
        if (command.size != 5) return WRONG_LENGTH.copyOf()
        val source = when (selectedFile) {
            SelectedFile.CAPABILITY_CONTAINER -> CAPABILITY_CONTAINER
            SelectedFile.NDEF -> ndefFile
            null -> return CONDITIONS_NOT_SATISFIED.copyOf()
        }
        val offset = ((command[2].toInt() and 0xff) shl 8) or (command[3].toInt() and 0xff)
        if (offset > source.size) return WRONG_OFFSET.copyOf()
        val requested = (command[4].toInt() and 0xff).let { if (it == 0) 256 else it }
        val length = minOf(requested, source.size - offset)
        return source.copyOfRange(offset, offset + length) + OK
    }

    private fun isSelectByName(command: ByteArray, aid: ByteArray): Boolean {
        if (command.size < 5 || command[3] != 0.toByte()) return false
        val length = command[4].toInt() and 0xff
        if (length != aid.size || (command.size != 5 + length && command.size != 6 + length)) return false
        return command.copyOfRange(5, 5 + length).contentEquals(aid)
    }

    companion object {
        private val NDEF_APPLICATION_AID = byteArrayOf(0xd2.toByte(), 0x76, 0x00, 0x00, 0x85.toByte(), 0x01, 0x01)
        internal val CAPABILITY_CONTAINER = byteArrayOf(
            0x00, 0x0f, 0x20, 0x00, 0x3b, 0x00, 0x34, 0x04, 0x06,
            0xe1.toByte(), 0x04, 0x7f, 0xff.toByte(), 0x00, 0xff.toByte(),
        )
        private val OK = byteArrayOf(0x90.toByte(), 0x00)
        private val FILE_NOT_FOUND = byteArrayOf(0x6a, 0x82.toByte())
        private val WRONG_LENGTH = byteArrayOf(0x67, 0x00)
        private val WRONG_OFFSET = byteArrayOf(0x6b, 0x00)
        private val CONDITIONS_NOT_SATISFIED = byteArrayOf(0x69, 0x85.toByte())
        private val CLASS_NOT_SUPPORTED = byteArrayOf(0x6e, 0x00)
        private val INSTRUCTION_NOT_SUPPORTED = byteArrayOf(0x6d, 0x00)

        internal fun buildNdefFile(invocationUrl: String): ByteArray {
            require(invocationUrl.startsWith("https://")) { "NDEF invocation must use HTTPS" }
            require(invocationUrl.toByteArray(StandardCharsets.UTF_8).size <= 1_024) { "NDEF invocation is too long" }
            val url = invocationUrl.toByteArray(StandardCharsets.UTF_8)
            val payload = byteArrayOf(0x00) + url
            val message = ByteArrayOutputStream().apply {
                val shortRecord = payload.size < 256
                write(if (shortRecord) 0xd1 else 0xc1)
                write(1)
                if (shortRecord) {
                    write(payload.size)
                } else {
                    write((payload.size ushr 24) and 0xff)
                    write((payload.size ushr 16) and 0xff)
                    write((payload.size ushr 8) and 0xff)
                    write(payload.size and 0xff)
                }
                write('U'.code)
                write(payload)
            }.toByteArray()
            require(message.size <= 0x7fff) { "NDEF message is too long" }
            return byteArrayOf((message.size ushr 8).toByte(), message.size.toByte()) + message
        }
    }
}
