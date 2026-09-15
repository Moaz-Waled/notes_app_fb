import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepo {
  Future<Either<String, String>> addCategory({required String categoryName});

  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getCategories();

  Future<Either<String, String>> deleteCategory({required String categoryId});

  Future<Either<String, String>> renameCategory({
    required String categoryId,
    required String newName,
  });

  Future<Either<String, String>> addNote({
    required String categoryId,
    required String note,
  });

  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getNotes({
    required String categoryId,
  });

  Future<Either<String, String>> deleteNote({
    required String categoryId,
    required String noteId,
  });

  Future<Either<String, String>> editNote({
    required String categoryId,
    required String noteId,
    required String newNote,
  });
}
