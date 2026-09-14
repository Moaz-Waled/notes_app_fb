import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/core/shared/app_snackbar.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_category/widgets/add_button.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/home_view.dart';

class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({super.key});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  TextEditingController category = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is AddCategoryFailure) {
          AppSnackbar.showSnackbar(message: state.errMessage);
        }
        if (state is AddCategorySuccess) {
          AppSnackbar.showSnackbar(message: state.message);
          Get.offAll(
            () => HomeView(),
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
                FieldTitle(title: 'Add category'),
                AppTextField(controller: category, hint: 'Enter your category'),
                VerticalSpace(value: 2),
                state is AddCategoryLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : AddButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            context.read<NotesCubit>().addCategory(
                              categoryName: category.text,
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
