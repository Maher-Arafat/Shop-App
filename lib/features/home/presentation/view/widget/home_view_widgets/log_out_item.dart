// ignore_for_file: use_build_context_synchronously

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanshop/core/resources/app_strings.dart';

import '../../../../../../core/resources/app_size.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/style.dart';
import '../../../../../../core/utils/app_router.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("token");
        GoRouter.of(context).push(RouterPath.splashView);
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Icon(
              FeatherIconsSnakeCase.log_out,
              color: ColorsManager.redColor,
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Text(
              AppStrings.logOut,
              style: StyleManager.headLine3,
            ),
          ],
        ),
      ),
    );
  }
}
