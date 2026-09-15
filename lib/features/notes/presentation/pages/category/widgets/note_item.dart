import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';

class NoteItem extends StatelessWidget {
  final String? categoryId;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;
  final String? note;

  const NoteItem({
    super.key,
    this.categoryId,
    this.onDeletePressed,
    this.onEditPressed,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note!, style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onDeletePressed,
                  icon: Icon(Icons.delete),
                ),
                IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit)),
              ],
            ),
            Divider(thickness: 2),
            VerticalSpace(value: 2),
          ],
        ),
      ),
    );
  }
}
