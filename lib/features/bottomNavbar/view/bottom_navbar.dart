import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/user.dart';
import 'package:flutter_application_1/features/home/view/home.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List bodyItems = [
      Home(userModel: widget.userModel),
      const Center(
        child: Text("DATA"),
      ),
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: bodyItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });

          debugPrint(_currentIndex.toString());
        },
        // type: BottomN,
        // landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
        ],
      ),
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
