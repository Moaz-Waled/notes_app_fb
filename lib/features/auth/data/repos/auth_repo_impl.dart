import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_fb/core/cache/cache_helper.dart';
import 'package:notes_app_fb/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<String, UserCredential>> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Left('The account already exists for that email.');
      }
      return Left(e.message ?? 'something went wrong.');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await CacheHelper().saveData(key: 'isLoggedin', value: true);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return Left('Incorrect email or password.');
      }
      return Left(e.message ?? 'something went wrong');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
