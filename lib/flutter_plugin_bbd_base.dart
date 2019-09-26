import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginBbdBase {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_bbd_base');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get bbd_UserId async {
    final String userId = await _channel.invokeMethod('getUserId');
    return userId;
  }
}
