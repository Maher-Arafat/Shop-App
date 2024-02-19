import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        PaddingSize.s20,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.darkWhite,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: ColorsManager.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
