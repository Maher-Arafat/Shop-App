import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/service_locator.dart';
import 'package:yallanshop/features/payment/data/repo/payment_repo.dart';
import 'package:yallanshop/features/payment/presentation/cubits/add_card/add_card_cubit.dart';
import 'package:yallanshop/features/payment/presentation/view/widget/add_card_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: StyleManager.title1.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => AddCardCubit(di<PaymentRepo>()),
        child: const AddCardViewBody(),
      ),
    );
  }
}
