import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/app_logo.dart';
import 'package:notes_app_fb/core/shared/auth_page_title.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/register/widgets/register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: ListView(
        children: [
          VerticalSpace(value: 4),
          GetBackButton(),
          AppLogo(),
          VerticalSpace(value: 2),
          AuthPageTitle(
            title: 'Signup',
            subtitle: 'Signup to continue using the app',
          ),
          VerticalSpace(value: 2),
          SignupForm(),
          VerticalSpace(value: 4),
        ],
      ),
    );
  }
}
