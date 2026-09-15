import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/constants/app_images.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final void Function()? onTap;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;

  const CategoryItem({
    super.key,
    this.title,
    this.onTap,
    this.onDeletePressed,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppIcons.folder, width: 80, height: 80),
              Text(title!, style: TextStyle(fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onDeletePressed,
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
