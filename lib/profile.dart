import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userModel.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                userModel.surname,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                userModel.height.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "${userModel.weight}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
