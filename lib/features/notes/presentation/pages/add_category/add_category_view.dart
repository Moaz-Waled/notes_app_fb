import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/features/notes/data/repo/notes_repo_impl.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_category/widgets/add_category_body.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Add Category')),
        body: AddCategoryBody(),
      ),
    );
  }
}
