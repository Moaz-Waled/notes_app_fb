import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/home_view.dart';

class RenameCategoryForm extends StatefulWidget {
  final String? oldName;
  final String? categoryId;

  const RenameCategoryForm({super.key, this.oldName, this.categoryId});

  @override
  State<RenameCategoryForm> createState() => _RenameCategoryFormState();
}

class _RenameCategoryFormState extends State<RenameCategoryForm> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController newName = TextEditingController();

  @override
  void initState() {
    super.initState();
    newName.text = widget.oldName!;
  }

  @override
  void dispose() {
    newName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is RenameCategoryFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is RenameCategorySuccess) {
          AppSnackbar.showSnackbar(message: state.message);
          Get.offAll(
            () => HomeView(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formState,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FieldTitle(title: 'Add new name'),
                AppTextField(controller: newName, hint: 'Enter new name'),
                VerticalSpace(value: 2),
                state is RenameCategoryLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: GeneralButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              context.read<NotesCubit>().renameCategory(
                                categoryId: widget.categoryId!,
                                newName: newName.text,
                              );
                            }
                          },
                          color: const Color.fromARGB(255, 250, 181, 77),
                          child: Text(
                            'Rename',
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
