import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelWidget extends StatefulWidget {
  final int batteryLevel;
  const BatteryLevelWidget({super.key, required this.batteryLevel});

  @override
  State<BatteryLevelWidget> createState() => _BatteryLevelWidgetState();
}

class _BatteryLevelWidgetState extends State<BatteryLevelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: .centerLeft,
                child: Container(
                  height: 100,
                  width: 300 * (widget.batteryLevel) / 100,
                  decoration: BoxDecoration(
                    color: _getBatteryColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "${widget.batteryLevel}%",
          style: TextStyle(
            fontSize: 40,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Color? _getBatteryColor() {
    if (widget.batteryLevel > 80) {
      return Colors.green;
    } else if (widget.batteryLevel > 20 && widget.batteryLevel < 45) {
      return Colors.orange;
    } else if (widget.batteryLevel < 20) {
      return Colors.red;
    }
  }
}
