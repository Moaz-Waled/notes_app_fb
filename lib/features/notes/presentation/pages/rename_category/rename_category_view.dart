import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/rename_category/widgets/rename_category_body.dart';

class RenameCategoryView extends StatelessWidget {
  final String? categoryName;
  final String? categoryId;

  const RenameCategoryView({super.key, this.categoryName, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Rename $categoryName')),
        body: RenameCategoryBody(oldName: categoryName, categoryId: categoryId),
      ),
    );
  }
}
