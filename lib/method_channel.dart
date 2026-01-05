import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel('com.example/my_channel');

  Future<String> getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return "Battery level :$batteryLevel%";
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return "failed to get battery level";
    }
  }
}
