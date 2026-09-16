import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/category_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/edit_note/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  final String? oldNote;
  final String? noteId;
  final String? categoryId;
  final String? categoryName;

  const EditNoteView({
    super.key,
    this.oldNote,
    this.noteId,
    this.categoryId,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.off(
                () => CategoryView(
                  categoryId: categoryId,
                  categoryName: categoryName,
                ),
                transition: Transition.fade,
                duration: Duration(milliseconds: 300),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Edit note'),
        ),
        body: EditNoteBody(
          oldNote: oldNote,
          categoryId: categoryId,
          noteId: noteId,
          categoryName: categoryName,
        ),
      ),
    );
  }
}
