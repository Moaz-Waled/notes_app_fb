import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(backgroundColor: Colors.white, body: LoginBody()),
    );
  }
}
