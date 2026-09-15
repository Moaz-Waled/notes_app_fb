import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_note/widgets/add_note_body.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/category_view.dart';

class AddNoteView extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;

  const AddNoteView({super.key, this.categoryId, this.categoryName});

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
                transition: Transition.leftToRight,
                duration: Duration(milliseconds: 300),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Add note'),
        ),
        body: AddNoteBody(categoryId: categoryId, categoryName: categoryName),
      ),
    );
  }
}
