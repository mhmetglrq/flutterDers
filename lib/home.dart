import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

import 'widgets/get_weight.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.blueGrey,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Merhaba ',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 500),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),
            const GetWeight(
              weight: "90",
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
