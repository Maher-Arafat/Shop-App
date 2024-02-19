import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/payment/presentation/cubits/payment/payment_cubit.dart';
import 'package:yallanshop/features/payment/presentation/view/widget/cards_list_view.dart';
import 'package:yallanshop/features/payment/presentation/view/widget/semi_transparent_button.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../register/presentation/view/widget/custom_bottom_button.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final _formKy = GlobalKey<FormState>();
  String? name;
  String? cardNumber;
  String? exp;
  String? cvv;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CardListView(),
                    Center(
                      child: SemiTransparentButton(onTap: () {
                        GoRouter.of(context).push(RouterPath.AddCardView);
                      }),
                    ),
                    Form(
                      key: _formKy,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.cardOwner,
                                style: StyleManager.headLine3,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                cursorColor: ColorsManager.primary,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorsManager.darkWhite,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) => name = value,
                                validator: (value) => (value!.isEmpty)
                                    ? AppStrings.fieldRequired
                                    : null,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.cardNumber,
                                style: StyleManager.headLine3,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                maxLength: 16,
                                cursorColor: ColorsManager.primary,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorsManager.darkWhite,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) => cardNumber = value,
                                validator: (value) => (value!.isEmpty)
                                    ? AppStrings.fieldRequired
                                    : (value.length < 16)
                                        ? AppStrings.minLength16
                                        : null,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.sizeOf(context).width / 2 - 25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.exp,
                                      style: StyleManager.headLine3,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      maxLength: 5,
                                      cursorColor: ColorsManager.primary,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorsManager.darkWhite,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (value) => exp = value,
                                      validator: (value) => (value!.isEmpty)
                                          ? AppStrings.fieldRequired
                                          : (value.length < 5)
                                              ? AppStrings.minLength5
                                              : null,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.sizeOf(context).width / 2 - 25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.cvv,
                                      style: StyleManager.headLine3,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      maxLength: 3,
                                      cursorColor: ColorsManager.primary,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorsManager.darkWhite,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (value) => cvv = value,
                                      validator: (value) => (value!.isEmpty)
                                          ? AppStrings.fieldRequired
                                          : (value.length < 3)
                                              ? AppStrings.minLength3
                                              : null,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.saveInfoCard,
                                style: StyleManager.headLine3,
                              ),
                              Switch.adaptive(
                                value: true,
                                onChanged: (value) {},
                                activeTrackColor: ColorsManager.primary,
                                activeColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomBottomButton(
          text: AppStrings.addCard,
          onPressed: () {
            if (_formKy.currentState!.validate()) {
              BlocProvider.of<PaymentCubit>(context).setCardData(
                ownerName: name!,
                cardNumber: cardNumber!,
                exp: exp!,
                cvv: cvv!,
              );
              showToast(
                msg: AppStrings.addedSuccessfully,
                color: Colors.green,
              );
              GoRouter.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
