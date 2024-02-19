import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/app_strings.dart';

import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/style.dart';

class DarkModeOptions extends StatelessWidget {
  const DarkModeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(FeatherIconsSnakeCase.sun),
              const SizedBox(width: AppSize.s10),
              Text(
                AppStrings.darkMode,
                style: StyleManager.headLine3,
              ),
            ],
          ),
          Switch(
            value: false,
            onChanged: (value) {},
            activeColor: ColorsManager.primary,
          )
        ],
      ),
    );
  }
}
