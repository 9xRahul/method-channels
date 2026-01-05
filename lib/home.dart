import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battery Level")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,

          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                ),
                Container(
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ],
            ),
            Text("75%", style: TextStyle(fontSize: 40, fontWeight: .bold)),
          ],
        ),
      ),
    );
  }
}
