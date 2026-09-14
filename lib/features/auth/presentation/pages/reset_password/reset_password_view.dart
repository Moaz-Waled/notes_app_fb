import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/reset_password/widgets/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: Scaffold(backgroundColor: Colors.white, body: ResetPasswordBody()),
    );
  }
}
