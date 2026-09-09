import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/login_view.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/register/widgets/register_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;
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
        if (state is CreateUserFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is CreateUserSuccess) {
          AppSnackbar.showSnackbar(
            message:
                'Success. Email verification sent please check (you can check junk or spam)',
          );
          Get.off(
            () => LoginView(),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Form(
          key: formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldTitle(title: 'Username'),
              AppTextField(hint: 'Enter your username'),
              VerticalSpace(value: 2),
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
              VerticalSpace(value: 2),
              FieldTitle(title: 'Confirm password'),
              AppTextField(
                hint: 'Confirm your password',
                isConfirmPassword: true,
                password: password.text,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  icon: Icon(
                    showConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                obscureText: !showConfirmPassword,
              ),
              VerticalSpace(value: 4),
              state is CreateUserLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    )
                  : RegisterButton(
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          authCubit.createUser(
                            email: email.text,
                            password: password.text,
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
