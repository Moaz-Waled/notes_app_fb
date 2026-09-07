import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';

class GeneralButton extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final void Function()? onPressed;

  const GeneralButton({super.key, this.color, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: color,
      height: 55,
      child: child,
    );
  }
}

class GetBackButton extends StatelessWidget {
  const GetBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 32),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(45, 158, 158, 158),
            borderRadius: BorderRadius.circular(15),
          ),
          width: 50,
          height: 50,
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
