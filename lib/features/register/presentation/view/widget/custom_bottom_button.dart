// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';

class CustomBottomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomBottomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorsManager.white,
            backgroundColor: ColorsManager.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
