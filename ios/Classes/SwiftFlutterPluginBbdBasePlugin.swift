import Flutter
import UIKit
import GD.Runtime

@objc public class SwiftFlutterPluginBbdBasePlugin: NSObject, FlutterPlugin, GDiOSDelegate {    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_bbd_base", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPluginBbdBasePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    default:
        result("Method not found");
        break;
    }
  }
}
