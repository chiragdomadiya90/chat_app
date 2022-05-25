import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getPermission();
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  getPermission() async {
    await SystemAlertWindow.checkPermissions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: MaterialButton(
              color: Colors.grey,
              onPressed: () {
                SystemAlertWindow.showSystemWindow(
                  margin: SystemWindowMargin(left: 100),
                  gravity: SystemWindowGravity.TOP,
                  header: SystemWindowHeader(
                    padding: SystemWindowPadding(left: 20),
                    decoration: SystemWindowDecoration(startColor: Colors.blue),
                    title: SystemWindowText(
                        text: "Hi  this is header", textColor: Colors.black),
                  ),
                  body: SystemWindowBody(
                      decoration:
                          SystemWindowDecoration(startColor: Colors.blue),
                      padding: SystemWindowPadding(left: 20),
                      rows: [
                        EachRow(columns: [
                          EachColumn(
                            text: SystemWindowText(
                                text: "Helloo worlds", textColor: Colors.black),
                          )
                        ])
                      ]),
                  footer: SystemWindowFooter(
                    buttons: [
                      SystemWindowButton(
                          width: 100,
                          height: 50,
                          text: SystemWindowText(text: 'close'),
                          tag: "close")
                    ],
                    decoration: SystemWindowDecoration(
                      startColor: Colors.blue,
                    ),
                  ),
                  height: 100,
                );
              },
              child: Text('Show dialog over other apps'),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                SystemAlertWindow.closeSystemWindow();
              },
              child: Text('close dialog'),
            ),
          ),
        ],
      ),
    );
  }
}

void callBack(tag) {
  print(tag);
  if (tag == "close") {
    SystemAlertWindow.closeSystemWindow();
  }
}
