import Flutter
import UIKit

public class SwiftRustyFlutterLibPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "rusty_flutter_lib", binaryMessenger: registrar.messenger())
    let instance = SwiftRustyFlutterLibPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
      result("iOS " + UIDevice.current.systemVersion)
    } else if (call.method == "hello") {
      let res = hello("Rob")
      let sr = String(cString: res!)
      hello_release(UnsafeMutablePointer(mutating: res))
      result(sr)
    } else {
      result("No method found")
    }
  }
}
