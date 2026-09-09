import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class CreateUserLoading extends AuthState {}

class CreateUserFailure extends AuthState {
  final String errMessage;

  CreateUserFailure({required this.errMessage});
}

class CreateUserSuccess extends AuthState {
  final UserCredential user;

  CreateUserSuccess({required this.user});
}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

class LoginSuccess extends AuthState {
  final UserCredential user;

  LoginSuccess({required this.user});
}

class SignoutLoading extends AuthState {}

class SignoutSuccess extends AuthState {}

class GoogleSigninLoading extends AuthState {}

class GoogleSigninFailure extends AuthState {
  final String errMessage;

  GoogleSigninFailure({required this.errMessage});
}

class GoogleSigninSuccess extends AuthState {
  final UserCredential user;

  GoogleSigninSuccess({required this.user});
}
