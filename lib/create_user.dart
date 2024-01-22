import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_application_1/models/user.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _nameController =
      TextEditingController(text: "Omer");
  final TextEditingController _surnameController =
      TextEditingController(text: "Duran");
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Oluştur"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7.5,
            ),
            child: TextFormField(
              controller: _nameController,
              style: const TextStyle(
                color: Colors.green,
              ),
              decoration: InputDecoration(
                labelText: "Ad",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7.5,
            ),
            child: TextFormField(
              controller: _surnameController,
              style: const TextStyle(
                color: Colors.green,
              ),
              decoration: InputDecoration(
                labelText: "Soyad",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7.5,
            ),
            child: TextFormField(
              controller: _weightController,
              style: const TextStyle(
                color: Colors.green,
              ),
              decoration: InputDecoration(
                labelText: "Kilo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7.5,
            ),
            child: TextFormField(
              controller: _heightController,
              style: const TextStyle(
                color: Colors.green,
              ),
              decoration: InputDecoration(
                labelText: "Boy",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              final userModel = UserModel(
                name: _nameController.text,
                surname: _surnameController.text,
                weight: double.parse(_weightController.text),
                height: double.parse(_heightController.text),
              );
              Navigator.pushNamed(context, RouteNames.profile, arguments: {
                "userModel": userModel,
              });
              _heightController.clear();
              _nameController.clear();
              _surnameController.clear();
              _weightController.clear();
            },
            color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              "Kaydet",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
