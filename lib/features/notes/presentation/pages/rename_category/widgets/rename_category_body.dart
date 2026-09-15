import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/rename_category/widgets/rename_category_form.dart';

class RenameCategoryBody extends StatelessWidget {
  final String? oldName;
  final String? categoryId;

  const RenameCategoryBody({super.key, this.oldName, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      alignment: Alignment.center,
      child: RenameCategoryForm(oldName: oldName, categoryId: categoryId),
    );
  }
}
