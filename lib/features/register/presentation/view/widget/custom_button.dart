// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/app_size.dart';

class CustomSocialButton extends StatelessWidget {
  final Color color;
  final String image;
  final Function()? onTap;
  const CustomSocialButton({
    Key? key,
    required this.color,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335,
        height: 49,
        constraints: const BoxConstraints(
          maxHeight: 49,
          maxWidth: 335,
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(AppSize.s10)),
        child: Image.asset(image),
      ),
    );
  }
}
