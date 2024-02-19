import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/register/presentation/view/widget/verification_code_body.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorsManager.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const VerificationCodeViewBody(),
    );
  }
}
