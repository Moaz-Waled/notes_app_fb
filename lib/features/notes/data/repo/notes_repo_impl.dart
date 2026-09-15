import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_fb/features/notes/domain/repo/notes_repo.dart';

class NotesRepoImpl extends NotesRepo {
  @override
  Future<Either<String, String>> addCategory({
    required String categoryName,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('Categories').add({
        'categoryName': categoryName,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
      return Right('Category added successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>>
  getCategories() async {
    try {
      return Right(
        await FirebaseFirestore.instance
            .collection('Categories')
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> deleteCategory({
    required String categoryId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("Categories")
          .doc(categoryId)
          .delete();
      return Right('Category deleted successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> renameCategory({
    required String categoryId,
    required String newName,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("Categories")
          .doc(categoryId)
          .update({'categoryName': newName});
      return Right('Category renamed successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
