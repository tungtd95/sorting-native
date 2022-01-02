package com.sekiro.sorting_native

import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class SortingNativePlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel
    private val methodChannel = "sorting_native"

    private val methodSort = "sorting_native_sort"
    private val methodSortArgInput = "input"

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, methodChannel)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == methodSort) {
            val arg = call.argument<List<Int>>(methodSortArgInput)
            if (!arg.isNullOrEmpty()) {
                result.success(Algorithm.quickSort(arg))
            } else {
                result.success(listOf<Int>())
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
