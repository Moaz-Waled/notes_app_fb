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

  Future<void> deleteCategory({required String categoryId}) async {
    emit(DeleteCategoryLoading());
    final response = await notesRepo.deleteCategory(categoryId: categoryId);

    response.fold(
      (errMessage) => emit(DeleteCategoryFailure(errMessage: errMessage)),
      (message) => emit(DeleteCategorySuccess(message: message)),
    );
  }

  Future<void> renameCategory({
    required String categoryId,
    required String newName,
  }) async {
    emit(RenameCategoryLoading());
    final response = await notesRepo.renameCategory(
      categoryId: categoryId,
      newName: newName,
    );

    response.fold(
      (errMessage) => emit(RenameCategoryFailure(errMessage: errMessage)),
      (message) => emit(RenameCategorySuccess(message: message)),
    );
  }

  Future<void> addNote({
    required String categoryId,
    required String note,
  }) async {
    emit(AddNoteLoading());
    final response = await notesRepo.addNote(
      categoryId: categoryId,
      note: note,
    );

    response.fold(
      (errMessage) => emit(AddNoteFailure(errMessage: errMessage)),
      (message) => emit(AddNoteSuccess(message: message)),
    );
  }

  Future<void> getNotes({required String categoryId}) async {
    emit(GetNotesLoading());
    final response = await notesRepo.getNotes(categoryId: categoryId);

    response.fold(
      (errMessage) => emit(GetNotesFailure(errMessage: errMessage)),
      (notes) => emit(GetNotesSuccess(notes: notes.docs)),
    );
  }

  Future<void> deleteNote({
    required String categoryId,
    required String noteId,
  }) async {
    emit(DeleteNoteLoading());
    final response = await notesRepo.deleteNote(
      categoryId: categoryId,
      noteId: noteId,
    );

    response.fold(
      (errMessage) => emit(DeleteNoteFailure(errMessage: errMessage)),
      (message) => emit(DeleteNoteSuccess(message: message)),
    );
  }

  Future<void> editNote({
    required String categoryId,
    required String noteId,
    required String newNote,
  }) async {
    emit(EditNoteLoading());
    final response = await notesRepo.editNote(
      categoryId: categoryId,
      noteId: noteId,
      newNote: newNote,
    );

    response.fold(
      (errMessage) => emit(EditNoteFailure(errMessage: errMessage)),
      (message) => emit(EditNoteSuccess(message: message)),
    );
  }
}
