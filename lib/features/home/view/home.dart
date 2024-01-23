import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';
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
                  // image: const DecorationImage(
                  //   image: NetworkImage(
                  //       "https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png"),
                  // ),
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     Colors.black,
                  //     Colors.red,
                  //     Colors.amber,
                  //   ],
                  //   stops: [
                  //     0.1,
                  //     0.5,
                  //     0.8,
                  //   ],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                  // border: const Border(
                  //   top: BorderSide(
                  //     color: Colors.black,
                  //     width: 2,
                  //   ),
                  //   left: BorderSide(
                  //     color: Colors.black,
                  //     width: 2,
                  //   ),
                  // ),
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 2.125,
                  // ),
                  // shape: BoxShape.rectangle,
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.amber,
                  //     offset: Offset(-10, 10),
                  //     blurRadius: 10,
                  //     spreadRadius: 1,
                  //   ),
                  //   BoxShadow(
                  //     color: Colors.black,
                  //     offset: Offset(-10, 10),
                  //     blurRadius: 10,
                  //     spreadRadius: 1,
                  //   ),
                  // ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(widget.userModel.userName)),
                    Text(widget.userModel.password),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.userModel.userName),
                    Text(widget.userModel.password),
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
                onTap: () {},
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
