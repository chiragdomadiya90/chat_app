import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

class FloatingDemo extends StatefulWidget {
  const FloatingDemo({Key? key}) : super(key: key);

  @override
  State<FloatingDemo> createState() => _FloatingDemoState();
}

class _FloatingDemoState extends State<FloatingDemo> {
  void initState() {
    getPermission();
    super.initState();
  }

  getPermission() async {
    await SystemAlertWindow.checkPermissions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SystemAlertWindow.showSystemWindow(
                    gravity: SystemWindowGravity.CENTER,
                    header: SystemWindowHeader(
                        title: SystemWindowText(text: 'Hello World')),
                    height: 500,
                    width: 250);
              },
              child: Text('Show Floating Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                SystemAlertWindow.showSystemWindow(
                    gravity: SystemWindowGravity.CENTER,
                    header: SystemWindowHeader(
                        title: SystemWindowText(text: 'Hello World')),
                    height: 500);
              },
              child: Text('Hide Floating Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
