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
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
        break;
    case "getUserId":
        let data = GDiOS.sharedInstance().getApplicationConfig();
        let userId = data.first(where: {$0.key == "userId"})?.value;
        result(userId);
        break;
    default:
        result("Method not found");
        break;
    }
  }
}
