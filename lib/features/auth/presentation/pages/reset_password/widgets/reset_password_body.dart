import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/reset_password/widgets/send_email_button.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: ListView(
        children: [
          VerticalSpace(value: 20),
          GetBackButton(),
          VerticalSpace(value: 6),
          FieldTitle(title: 'Email'),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SendResetPasswordEmailFailure) {
                AppSnackbar.showSnackbar(message: state.errMessage);
              }
              if (state is SendResetPasswordEmailSuccess) {
                AppSnackbar.showSnackbar(
                  message:
                      'Email sent successfully, check your email (you can check junk or spam)',
                );
              }
            },
            builder: (context, state) {
              final authCubit = context.read<AuthCubit>();
              return Form(
                key: formState,
                child: Column(
                  children: [
                    AppTextField(
                      controller: email,
                      hint: 'Enter your email',
                      isEmail: true,
                    ),
                    VerticalSpace(value: 2),
                    state is SendResetPasswordEmailLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          )
                        : SendEmailButton(
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                if (state is SendResetPasswordEmailSuccess) {
                                  AppSnackbar.showSnackbar(
                                    message:
                                        'Email sent successfully, check your email (you can check junk or spam)',
                                  );
                                  return;
                                }
                                authCubit.sendResetPasswordEmail(
                                  email: email.text,
                                );
                              }
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
