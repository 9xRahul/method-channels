import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:method_channel/battery_level_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example/my_channel');
  int batteryLevel = -1;
  Future<void> _getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = -1;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _getBatteryLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battery Level")),
      body: Container(
        color: Colors.black,
        child: Center(
          child: batteryLevel == -1
              ? CircularProgressIndicator()
              : BatteryLevelWidget(batteryLevel: batteryLevel),
        ),
      ),
    );
  }
}
