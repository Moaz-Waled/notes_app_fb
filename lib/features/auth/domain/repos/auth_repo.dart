import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<String, UserCredential>> createUser({
    required String email,
    required String password,
  });

  Future<Either<String, UserCredential>> login({
    required String email,
    required String password,
  });

  Future<Either<String, UserCredential>> googleSignin();

  Future<Either<String, String>> sendResetPasswordEmail({required String email});
}
