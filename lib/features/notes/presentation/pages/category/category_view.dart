import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_note/add_note_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/widgets/category_body.dart';

class CategoryView extends StatelessWidget {
  final String? categoryName;
  final String? categoryId;

  const CategoryView({super.key, this.categoryName, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(categoryName!)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.off(
              () => AddNoteView(
                categoryId: categoryId,
                categoryName: categoryName,
              ),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: CategoryBody(categoryId: categoryId),
      ),
    );
  }
}
