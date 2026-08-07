package org.localsend.localsend_ng

import android.app.Activity
import android.companion.AssociationInfo
import android.companion.AssociationRequest
import android.companion.BluetoothDeviceFilter
import android.companion.CompanionDeviceManager
import android.content.Context
import android.content.IntentSender
import android.os.Build
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor

private const val TAG = "CompanionBridge"
private const val REQUEST_CODE_ASSOCIATE = 100

class CompanionBridge(private val activity: Activity) {

    private var pendingResult: MethodChannel.Result? = null

    fun associate(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            result.error("UNSUPPORTED", "CompanionDeviceManager requires Android 8+", null)
            return
        }

        val cdm = activity.getSystemService(Context.COMPANION_DEVICE_SERVICE) as? CompanionDeviceManager
        if (cdm == null) {
            result.error("UNAVAILABLE", "CompanionDeviceManager service not available", null)
            return
        }

        val filter = BluetoothDeviceFilter.Builder().build()
        val request = AssociationRequest.Builder()
            .addDeviceFilter(filter)
            .setSingleDevice(false)
            .build()

        pendingResult = result

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val executor: Executor = activity.mainExecutor
            cdm.associate(request, executor, object : CompanionDeviceManager.Callback() {
                override fun onAssociationPending(intentSender: IntentSender) {
                    try {
                        activity.startIntentSenderForResult(
                            intentSender, REQUEST_CODE_ASSOCIATE,
                            null, 0, 0, 0
                        )
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to launch association intent", e)
                        pendingResult?.error("LAUNCH_FAILED", e.message, null)
                        pendingResult = null
                    }
                }

                override fun onAssociationCreated(associationInfo: AssociationInfo) {
                    Log.i(TAG, "Association created: id=${associationInfo.id}")
                    pendingResult?.success(mapOf(
                        "id" to associationInfo.id,
                        "deviceName" to (associationInfo.displayName?.toString() ?: "Unknown")
                    ))
                    pendingResult = null
                }

                override fun onFailure(error: CharSequence?) {
                    Log.w(TAG, "Association failed: $error")
                    pendingResult?.error("ASSOCIATION_FAILED", error?.toString() ?: "Unknown error", null)
                    pendingResult = null
                }
            })
        } else {
            @Suppress("DEPRECATION")
            cdm.associate(request, object : CompanionDeviceManager.Callback() {
                @Deprecated("Deprecated in API 33")
                override fun onDeviceFound(chooserLauncher: IntentSender) {
                    try {
                        activity.startIntentSenderForResult(
                            chooserLauncher, REQUEST_CODE_ASSOCIATE,
                            null, 0, 0, 0
                        )
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to launch association intent", e)
                        pendingResult?.error("LAUNCH_FAILED", e.message, null)
                        pendingResult = null
                    }
                }

                override fun onFailure(error: CharSequence?) {
                    Log.w(TAG, "Association failed: $error")
                    pendingResult?.error("ASSOCIATION_FAILED", error?.toString() ?: "Unknown error", null)
                    pendingResult = null
                }
            }, null)
        }
    }

    fun getAssociations(): List<Map<String, Any?>> {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return emptyList()

        val cdm = activity.getSystemService(Context.COMPANION_DEVICE_SERVICE) as? CompanionDeviceManager
            ?: return emptyList()

        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            cdm.myAssociations.map { info ->
                mapOf(
                    "id" to info.id,
                    "deviceName" to (info.displayName?.toString() ?: "Unknown"),
                    "deviceAddress" to (info.deviceMacAddress?.toString() ?: "")
                )
            }
        } else {
            @Suppress("DEPRECATION")
            cdm.associations.mapIndexed { index, address ->
                mapOf(
                    "id" to index,
                    "deviceName" to address,
                    "deviceAddress" to address
                )
            }
        }
    }

    fun disassociate(id: Int, result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            result.error("UNSUPPORTED", "Disassociate by ID requires Android 13+", null)
            return
        }

        val cdm = activity.getSystemService(Context.COMPANION_DEVICE_SERVICE) as? CompanionDeviceManager
        if (cdm == null) {
            result.error("UNAVAILABLE", "CompanionDeviceManager service not available", null)
            return
        }

        try {
            cdm.disassociate(id)
            result.success(null)
        } catch (e: Exception) {
            result.error("DISASSOCIATE_FAILED", e.message, null)
        }
    }

    fun startObservingDevicePresence(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            result.error("UNSUPPORTED", "Device presence observing requires Android 12+", null)
            return
        }

        val cdm = activity.getSystemService(Context.COMPANION_DEVICE_SERVICE) as? CompanionDeviceManager
        if (cdm == null) {
            result.error("UNAVAILABLE", "CompanionDeviceManager service not available", null)
            return
        }

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                for (association in cdm.myAssociations) {
                    cdm.startObservingDevicePresence(association.deviceMacAddress?.toString() ?: continue)
                }
            } else {
                @Suppress("DEPRECATION")
                for (address in cdm.associations) {
                    cdm.startObservingDevicePresence(address)
                }
            }
            result.success(null)
        } catch (e: Exception) {
            Log.w(TAG, "startObservingDevicePresence failed", e)
            result.error("OBSERVE_FAILED", e.message, null)
        }
    }

    fun onActivityResult(requestCode: Int, resultCode: Int): Boolean {
        if (requestCode != REQUEST_CODE_ASSOCIATE) return false

        if (resultCode == Activity.RESULT_OK) {
            pendingResult?.success(mapOf("id" to -1, "deviceName" to "Associated"))
        } else {
            pendingResult?.error("CANCELED", "User canceled association", null)
        }
        pendingResult = null
        return true
    }
}
