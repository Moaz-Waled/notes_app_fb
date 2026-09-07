import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/constants/app_images.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 13),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(45, 158, 158, 158),
          borderRadius: BorderRadius.circular(70),
        ),
        width: SizeConfig.defaultSize! * 12,
        height: SizeConfig.defaultSize! * 12,
        alignment: Alignment.center,
        child: Image.asset(AppImages.logo, width: 60, height: 60),
      ),
    );
  }
}
