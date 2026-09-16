import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/edit_note/widgets/edit_note_form.dart';

class EditNoteBody extends StatelessWidget {
  final String? oldNote;
  final String? noteId;
  final String? categoryId;
  final String? categoryName;

  const EditNoteBody({
    super.key,
    this.oldNote,
    this.noteId,
    this.categoryId,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: Center(
        child: SingleChildScrollView(
          child: EditNoteForm(
            oldNote: oldNote,
            categoryId: categoryId,
            noteId: noteId,
            categoryName: categoryName,
          ),
        ),
      ),
    );
  }
}
