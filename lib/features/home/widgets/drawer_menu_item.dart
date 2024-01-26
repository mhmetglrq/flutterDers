import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: context.paddingAllDefault,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        padding: context.paddingHorizontalDefault,
        child: Row(
          children: [
            Icon(icon),
            Padding(
              padding: context.paddingHorizontalLow,
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
