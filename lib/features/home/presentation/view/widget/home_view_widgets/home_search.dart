import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              cursorColor: ColorsManager.primary,
              decoration: InputDecoration(
                prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                prefixIconColor: ColorsManager.lightGrey,
                hintText: AppStrings.search,
                hintStyle: StyleManager.subtitle,
                fillColor: ColorsManager.darkWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primary,
            minimumSize: const Size(50, 50),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Icon(
            FontAwesomeIcons.searchengin,
            color: ColorsManager.darkWhite,
          ),
        )
      ],
    );
  }
}
