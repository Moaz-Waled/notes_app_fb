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

class AddNoteForm extends StatefulWidget {
  final String? categoryId;
  final String? categoryName;

  const AddNoteForm({super.key, this.categoryId, this.categoryName});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController note = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is AddNoteSuccess) {
          AppSnackbar.showSnackbar(message: state.message);
          Get.off(
            () => CategoryView(
              categoryId: widget.categoryId,
              categoryName: widget.categoryName,
            ),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formState,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FieldTitle(title: 'Add note'),
                AppTextField(controller: note, hint: 'Enter your note'),
                VerticalSpace(value: 2),
                state is AddNoteLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: GeneralButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              context.read<NotesCubit>().addNote(
                                categoryId: widget.categoryId!,
                                note: note.text,
                              );
                            }
                          },
                          color: const Color.fromARGB(255, 250, 181, 77),
                          child: Text(
                            'Add',
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
          ),
        );
      },
    );
  }
}
