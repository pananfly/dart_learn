package com.pananfly.dart_learn

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var channel = MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, "")
        channel.setMethodCallHandler {
            methodCall: MethodCall, result: MethodChannel.Result ->

        }
    }
}
