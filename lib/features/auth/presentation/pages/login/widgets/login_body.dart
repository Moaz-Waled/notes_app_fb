import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/app_logo.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/go_to_reg_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/login_form.dart';
import 'package:notes_app_fb/core/shared/auth_page_title.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: ListView(
        children: [
          VerticalSpace(value: 8),
          AppLogo(),
          VerticalSpace(value: 2),
          AuthPageTitle(
            title: 'Login',
            subtitle: 'Login to continue using the app',
          ),
          VerticalSpace(value: 2),
          LoginForm(),
          VerticalSpace(value: 6),
          GoToRegWidget(),
          VerticalSpace(value: 4),
        ],
      ),
    );
  }
}
