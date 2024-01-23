import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Ekle",
        elevation: 5,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
