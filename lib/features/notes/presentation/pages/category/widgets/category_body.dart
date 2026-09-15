import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/widgets/note_item.dart';

class CategoryBody extends StatefulWidget {
  final String? categoryId;

  const CategoryBody({super.key, this.categoryId});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  List notes = [];

  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getNotes(categoryId: widget.categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is GetNotesFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is GetNotesSuccess) {
          notes = state.notes;
        }
        if (state is DeleteNoteFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is DeleteNoteSuccess) {
          AppSnackbar.showSnackbar(message: state.message);
          context.read<NotesCubit>().getNotes(categoryId: widget.categoryId!);
        }
      },
      builder: (context, state) {
        return state is GetNotesLoading || state is DeleteNoteLoading
            ? Center(child: CircularProgressIndicator(color: Colors.orange))
            : notes.isEmpty
            ? Center(
                child: Text('No notes found.', style: TextStyle(fontSize: 20)),
              )
            : Container(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteItem(
                      categoryId: widget.categoryId,
                      note: notes[index]['note'],
                      onDeletePressed: () {
                        context.read<NotesCubit>().deleteNote(
                          categoryId: widget.categoryId!,
                          noteId: notes[index].id,
                        );
                      },
                      onEditPressed: () {},
                    );
                  },
                ),
              );
      },
    );
  }
}
