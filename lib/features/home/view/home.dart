import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_application_1/config/utility/constants/drawer_menu_items.dart';
import 'package:flutter_application_1/core/models/user.dart';

import '../widgets/drawer_menu_item.dart';

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
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Text("widget.userModel.userName")),
                    const Text("widget.userModel.password"),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: context.dynamicWidth(0.3),
                        height: context.dynamicWidth(0.3),
                        child: Image.network(
                          "https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 15,
                surfaceTintColor: Colors.black38,
                color: Colors.white,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                borderOnForeground: true,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(widget.userModel.userName),
                    // Text(widget.userModel.password),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent,
        // surfaceTintColor: Colors.black,
        elevation: 15,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        width: context.dynamicWidth(0.8),
        child: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: context.dynamicHeight(0.1),
              ),
              DrawerMenuItem(
                icon: Icons.fire_truck,
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteNames.utilityPage,
                ),
                title: 'Taşıma',
              ),
              DrawerMenuItem(icon: Icons.abc, onTap: () {}, title: "ABC"),
              DrawerMenuItem(icon: Icons.abc, onTap: () {}, title: "ABC"),
              DrawerMenuItem(icon: Icons.abc, onTap: () {}, title: "ABC"),
              DrawerMenuItem(icon: Icons.abc, onTap: () {}, title: "ABC"),
              for (int i = 0; i < menuItems.length; i++) menuItems[i]
            ],
          ),
        ),
      ),
    );
  }
}
