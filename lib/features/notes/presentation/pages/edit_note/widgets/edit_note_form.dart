import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/category/category_view.dart';

class EditNoteForm extends StatefulWidget {
  final String? oldNote;
  final String? categoryId;
  final String? noteId;
  final String? categoryName;

  const EditNoteForm({
    super.key,
    this.oldNote,
    this.categoryId,
    this.noteId,
    this.categoryName,
  });

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  final TextEditingController newNote = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newNote.text = widget.oldNote!;
  }

  @override
  void dispose() {
    newNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is EditNoteFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is EditNoteSuccess) {
          AppSnackbar.showSnackbar(message: state.message);
          Get.off(
            () => CategoryView(
              categoryId: widget.categoryId,
              categoryName: widget.categoryName,
            ),
            transition: Transition.fade,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldTitle(title: 'Edit note'),
              AppTextField(controller: newNote, hint: 'Enter new note'),
              VerticalSpace(value: 2),
              state is EditNoteLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: GeneralButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            context.read<NotesCubit>().editNote(
                              categoryId: widget.categoryId!,
                              noteId: widget.noteId!,
                              newNote: newNote.text,
                            );
                          }
                        },
                        color: const Color.fromARGB(255, 250, 181, 77),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
