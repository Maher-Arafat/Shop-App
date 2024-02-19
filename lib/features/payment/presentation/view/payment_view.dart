import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/features/payment/presentation/view/widget/payment_view_body.dart';

import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/style.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.payment,
          style: StyleManager.title1.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(child: PaymentViewBody()),
    );
  }
}
