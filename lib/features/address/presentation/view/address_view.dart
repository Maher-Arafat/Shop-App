import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/address/presentation/view/widget/address_view_body.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          AppStrings.address,
          style: StyleManager.title1.copyWith(
            color: ColorsManager.black,
          ),
        ),
      ),
      body: const AddressViewBody(),
    );
  }
}
