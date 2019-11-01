import 'package:flutter/material.dart';
import 'package:flutter_plugin_bbd_application/flutter_plugin_bbd_application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String platformVersion = "";

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  loadVersion() async {
    final version = await FlutterPluginBbdApplication.getVersion;
    setState(() {
      platformVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter-plugin-bbd-base example'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running'),
              Text('BlackBerry Dynamics Version: $platformVersion'),
            ],
          ),
        ),
      ),
    );
  }
}
