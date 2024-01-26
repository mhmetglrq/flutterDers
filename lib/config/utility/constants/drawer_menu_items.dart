import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_application_1/features/home/widgets/drawer_menu_item.dart';

List<Builder> menuItems = [
  Builder(builder: (context) {
    return DrawerMenuItem(
        icon: Icons.person,
        onTap: () => Navigator.pushNamed(context, RouteNames.profile),
        title: "Profile");
  }),
  Builder(builder: (context) {
    return DrawerMenuItem(
        icon: Icons.ac_unit_sharp, onTap: () {}, title: "Getirme");
  }),
  Builder(builder: (context) {
    return DrawerMenuItem(
        icon: Icons.fire_truck, onTap: () {}, title: "2 Taşıma");
  }),
];
