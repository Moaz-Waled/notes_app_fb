import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/widgets/login_logo.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/widgets/login_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: ListView(
        children: [
          VerticalSpace(value: 8),
          LoginLogo(),
          VerticalSpace(value: 2),
          LoginText(),
        ],
      ),
    );
  }
}
