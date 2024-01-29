import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('testBox');
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("${box.get("name")}"),
              Text("${box.get("age")}"),
            ],
          ),
        ),
      ),
    );
  }
}
