import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepo {
  Future<Either<String, String>> addCategory({required String categoryName});

  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getCategories();
}
