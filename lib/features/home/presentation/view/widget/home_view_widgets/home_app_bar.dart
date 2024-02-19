import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      pinned: false,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          FontAwesomeIcons.barsStaggered,
          color: ColorsManager.primary,
        ),
      ),
      centerTitle: true,
      title: Text(
        AppStrings.appName,
        style: StyleManager.headLine1.copyWith(color: ColorsManager.primary),
      ),
      actions: [
        IconButton(
          onPressed: () => GoRouter.of(context).push(RouterPath.cartView),
          icon: Icon(
            FontAwesomeIcons.cartShopping,
            color: ColorsManager.primary,
          ),
        ),
      ],
    );
  }
}
