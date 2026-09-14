import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/core/cache/cache_helper.dart';
import 'package:notes_app_fb/features/notes/domain/repo/notes_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.notesRepo) : super(NotesInitial());

  final NotesRepo notesRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    await FirebaseAuth.instance.signOut();
    await CacheHelper().saveData(key: 'isLoggedin', value: false);
    emit(SignOutSuccess());
  }

  Future<void> addCategory({required String categoryName}) async {
    emit(AddCategoryLoading());
    final response = await notesRepo.addCategory(categoryName: categoryName);

    response.fold(
      (errMessage) => emit(AddCategoryFailure(errMessage: errMessage)),
      (message) => emit(AddCategorySuccess(message: message)),
    );
  }

  Future<void> getCategories() async {
    emit(GetCategoryDataLoading());
    final response = await notesRepo.getCategories();

    response.fold(
      (errMessage) => emit(GetCategoryDataFailure(errMessage: errMessage)),
      (categories) => emit(GetCategoryDataSuccess(categories: categories.docs)),
    );
  }
}
