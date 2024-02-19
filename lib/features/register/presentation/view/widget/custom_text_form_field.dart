// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType??TextInputType.text,
      cursorHeight: 0,
      cursorWidth: 0,
      validator: validator,
      cursorColor: ColorsManager.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: PaddingSize.s20,
        ),
        label: Text(label),
        labelStyle: TextStyle(color: ColorsManager.primary),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
          ),
        ),
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  final String label;
  final String? Function(String?) validator;

  const CustomPasswordTextFormField({
    Key? key,
    required this.label,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      cursorHeight: 0,
      cursorWidth: 0,
      validator: widget.validator,
      cursorColor: ColorsManager.primary,
      decoration: InputDecoration(
        suffix: suffixIcon(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: PaddingSize.s20,
        ),
        label: Text(widget.label),
        labelStyle: TextStyle(color: ColorsManager.primary),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
          ),
        ),
      ),
    );
  }

  suffixIcon() {
    if (obscureText == true) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          FontAwesomeIcons.lock,
          color: ColorsManager.primary,
          size: AppSize.s20,
        ),
      );
    } else {
      return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          FontAwesomeIcons.lockOpen,
          color: ColorsManager.primary,
          size: AppSize.s20,
        ),
      );
    }
  }
}
