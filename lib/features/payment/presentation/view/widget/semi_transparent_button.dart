import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yallanshop/core/resources/app_strings.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/style.dart';

class SemiTransparentButton extends StatelessWidget {
  final void Function()? onTap;

  const SemiTransparentButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: 335,
          height: 50,
          decoration: BoxDecoration(
              color: ColorsManager.lightPrimary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: ColorsManager.primary,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.squarePlus,
                color: ColorsManager.primary,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                AppStrings.addCard,
                style: StyleManager.headLine3.copyWith(
                  color: ColorsManager.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
