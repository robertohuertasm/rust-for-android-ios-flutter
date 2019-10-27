package com.robertohuertas.rusty_flutter_lib

// importing the Android library
import com.robertohuertas.rusty_android_lib.*

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class RustyFlutterLibPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "rusty_flutter_lib")
      channel.setMethodCallHandler(RustyFlutterLibPlugin())
      // dynamically loading the android library
      loadRustyLib()
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when {
      call.method == "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      call.method == "hello" -> {
        val to = call.argument<String>("to")
          if (to == null) {
            result.success("No to parameter found")
          } else {
            // we're using the helloDirect function here
            // but you could also use the hello function, too.
            val res = helloDirect(to)
            result.success(res)
          }
      }
      else -> result.notImplemented()
    }
  }
}
