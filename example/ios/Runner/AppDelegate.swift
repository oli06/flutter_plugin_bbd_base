import UIKit
import Flutter
import flutter_plugin_bbd_base

@UIApplicationMain
@objc class AppDelegate : FlutterBBDAppDelegate, FlutterBBDAuthorize {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FlutterPluginBbdBasePlugin.sharedInstance()?.appDelegate = self
        FlutterPluginBbdBasePlugin.sharedInstance()?.authorize()
                
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func didAuthorize() {
        GeneratedPluginRegistrant.register(with: self)
    }
}
