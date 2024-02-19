import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorsManager.primary,
      ),
    );
  }
}
