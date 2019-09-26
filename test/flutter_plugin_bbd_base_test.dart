import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_bbd_base/flutter_plugin_bbd_base.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_plugin_bbd_base');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterPluginBbdBase.platformVersion, '42');
  });
}
