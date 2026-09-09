import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/google_login_button.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/user_login_button.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/reset_password/reset_password_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/home_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  bool showPassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is LoginSuccess) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Get.offAll(
              () => HomeView(),
              transition: Transition.fade,
              duration: Duration(milliseconds: 300),
            );
          } else {
            AppSnackbar.showSnackbar(
              message:
                  'Verify your email first. Check your email (you can check junk or spam)',
            );
          }
        }
        if (state is GoogleSigninFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is GoogleSigninSuccess) {
          Get.offAll(
            () => HomeView(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Form(
          key: formStateKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldTitle(title: 'Email'),
              AppTextField(
                controller: email,
                hint: 'Enter your email',
                isEmail: true,
              ),
              VerticalSpace(value: 2),
              FieldTitle(title: 'Password'),
              AppTextField(
                controller: password,
                hint: 'Enter your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                obscureText: !showPassword,
              ),
              VerticalSpace(value: 1),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ResetPasswordView(),
                      transition: Transition.upToDown,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                  child: Text(
                    'Forget password ?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              VerticalSpace(value: 4),
              state is LoginLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    )
                  : UserLoginButton(
                      onPressed: () {
                        if (formStateKey.currentState!.validate()) {
                          authCubit.login(
                            email: email.text,
                            password: password.text,
                          );
                        }
                      },
                    ),
              VerticalSpace(value: 4),
              state is GoogleSigninLoading
                  ? Center(child: CircularProgressIndicator(color: Colors.red))
                  : GoogleLoginButton(
                      onPressed: () {
                        authCubit.googleSignin();
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
