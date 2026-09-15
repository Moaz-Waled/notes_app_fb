part of 'notes_cubit.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class SignOutLoading extends NotesState {}

final class SignOutSuccess extends NotesState {}

final class AddCategoryLoading extends NotesState {}

final class AddCategoryFailure extends NotesState {
  final String errMessage;

  AddCategoryFailure({required this.errMessage});
}

final class AddCategorySuccess extends NotesState {
  final String message;

  AddCategorySuccess({required this.message});
}

final class GetCategoryDataLoading extends NotesState {}

final class GetCategoryDataFailure extends NotesState {
  final String errMessage;

  GetCategoryDataFailure({required this.errMessage});
}

final class GetCategoryDataSuccess extends NotesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> categories;

  GetCategoryDataSuccess({required this.categories});
}

final class DeleteCategoryLoading extends NotesState {}

final class DeleteCategoryFailure extends NotesState {
  final String errMessage;

  DeleteCategoryFailure({required this.errMessage});
}

final class DeleteCategorySuccess extends NotesState {
  final String message;

  DeleteCategorySuccess({required this.message});
}

final class RenameCategoryLoading extends NotesState {}

final class RenameCategoryFailure extends NotesState {
  final String errMessage;

  RenameCategoryFailure({required this.errMessage});
}

final class RenameCategorySuccess extends NotesState {
  final String message;

  RenameCategorySuccess({required this.message});
}

final class AddNoteLoading extends NotesState {}

final class AddNoteFailure extends NotesState {
  final String errMessage;

  AddNoteFailure({required this.errMessage});
}

final class AddNoteSuccess extends NotesState {
  final String message;

  AddNoteSuccess({required this.message});
}

final class GetNotesLoading extends NotesState {}

final class GetNotesFailure extends NotesState {
  final String errMessage;

  GetNotesFailure({required this.errMessage});
}

final class GetNotesSuccess extends NotesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> notes;

  GetNotesSuccess({required this.notes});
}

final class DeleteNoteLoading extends NotesState {}

final class DeleteNoteFailure extends NotesState {
  final String errMessage;

  DeleteNoteFailure({required this.errMessage});
}

final class DeleteNoteSuccess extends NotesState {
  final String message;

  DeleteNoteSuccess({required this.message});
}

final class EditNoteLoading extends NotesState {}

final class EditNoteFailure extends NotesState {
  final String errMessage;

  EditNoteFailure({required this.errMessage});
}

final class EditNoteSuccess extends NotesState {
  final String message;

  EditNoteSuccess({required this.message});
}
