import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';

class HorizontalSpace extends StatelessWidget {
  final double? value;
  const HorizontalSpace({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.defaultSize! * value!);
  }
}

class VerticalSpace extends StatelessWidget {
  final double? value;
  const VerticalSpace({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.defaultSize! * value!);
  }
}
