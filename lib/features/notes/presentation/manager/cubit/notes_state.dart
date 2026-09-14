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
