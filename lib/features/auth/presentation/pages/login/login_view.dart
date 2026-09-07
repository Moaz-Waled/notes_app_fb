import 'package:flutter/material.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: LoginBody());
  }
}
