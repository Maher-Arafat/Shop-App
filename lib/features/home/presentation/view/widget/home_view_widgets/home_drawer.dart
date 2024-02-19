import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/dark_mode_options.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/drawer_item.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/log_out_item.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/profile_card.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: PaddingSize.s20),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).closeDrawer(),
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                    ),
                  ),
                ],
              ),
              const ProfileCard(),
              Column(
                children: [
                  const SizedBox(height: AppSize.s30),
                  const DarkModeOptions(),
                  DrawerItem(
                    icon: FeatherIconsSnakeCase.alert_circle,
                    title: AppStrings.accountManager,
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: FeatherIconsSnakeCase.lock,
                    title: AppStrings.password,
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.shopping_bag_outlined,
                    title: AppStrings.orders,
                    onTap: () => GoRouter.of(context).push(RouterPath.cartView),
                  ),
                  DrawerItem(
                    icon: FeatherIconsSnakeCase.credit_card,
                    title: AppStrings.myCards,
                    onTap: () =>
                        GoRouter.of(context).push(RouterPath.paymentView),
                  ),
                  DrawerItem(
                    icon: FeatherIconsSnakeCase.heart,
                    title: AppStrings.wishList,
                    onTap: () =>
                        GoRouter.of(context).push(RouterPath.favouriteView),
                  ),
                  const SizedBox(height: AppSize.s30),
                  const LogOutItem(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
