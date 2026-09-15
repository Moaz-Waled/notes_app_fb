import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_note/widgets/add_note_form.dart';

class AddNoteBody extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;

  const AddNoteBody({super.key, this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: Center(
        child: AddNoteForm(categoryId: categoryId, categoryName: categoryName),
      ),
    );
  }
}
