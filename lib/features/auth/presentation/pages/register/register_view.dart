import 'package:flutter/material.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/register/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: RegisterBody());
  }
}
