import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/add_category/widgets/add_category_form.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: Center(child: AddCategoryForm()),
    );
  }
}
