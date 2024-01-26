import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({super.key, required this.profilePhoto, this.radius});

  final String profilePhoto;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalLow,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(
            context.dynamicWidth(0.01),
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.yellow,
              ],
            ),
          ),
          child: Container(
            width: radius ?? context.dynamicWidth(0.2),
            height: radius ?? context.dynamicWidth(0.2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  profilePhoto,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
