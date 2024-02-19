import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/register/presentation/view/widget/forgot_password_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.black,
          ),
          onPressed: ()=>GoRouter.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        
      ),
      body: const ForgotPasswordViewBody(),
    );
  }
}
