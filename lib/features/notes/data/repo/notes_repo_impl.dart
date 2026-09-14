import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_app_fb/features/notes/domain/repo/notes_repo.dart';

class NotesRepoImpl extends NotesRepo {
  @override
  Future<Either<String, String>> addCategory({
    required String categoryName,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('Categories').add({
        'categoryName': categoryName,
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
        await FirebaseFirestore.instance.collection('Categories').get(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
