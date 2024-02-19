import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/widgets/toast.dart';
import 'package:yallanshop/features/payment/data/model/card_model.dart';
import 'package:yallanshop/features/payment/presentation/cubits/add_card/add_card_cubit.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';

class AddCardViewBody extends StatefulWidget {
  const AddCardViewBody({super.key});

  @override
  State<AddCardViewBody> createState() => _AddCardViewBodyState();
}

class _AddCardViewBodyState extends State<AddCardViewBody> {
  final _formKy = GlobalKey<FormState>();
  int _slctdValue = 0;
  String? name;
  String? cardNumber;
  String? exp;
  String? cvv;
  final List<String> _paymentMethodImage = [
    AssetsManager.paybalImage,
    AssetsManager.bankImage,
    AssetsManager.masterCardImage,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _paymentMethodImage.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              _slctdValue = index;
                            }),
                            child: Container(
                              height: 50,
                              width:
                                  (MediaQuery.sizeOf(context).width - 50) / 3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _slctdValue == index
                                      ? ColorsManager.orange
                                      : ColorsManager.darkWhite,
                                  width: 2,
                                ),
                                color: _slctdValue == index
                                    ? ColorsManager.lightOrange
                                    : ColorsManager.darkWhite,
                                image: DecorationImage(
                                    image:
                                        AssetImage(_paymentMethodImage[index])),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
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
                                onChanged: (value) {
                                  cardNumber = value;
                                },
                                validator: (value) => (value!.isEmpty)
                                    ? AppStrings.fieldRequired
                                    : (value.length < 16)
                                        ? AppStrings.minLength16
                                        : null,
                                maxLength: 16,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorsManager.primary,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorsManager.darkWhite,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomBottomButton(
          text: AppStrings.addCard,
          onPressed: () {
            if (_formKy.currentState!.validate()) {
              BlocProvider.of<AddCardCubit>(context).addCard(CardModel(
                name: name!,
                cardNumber: cardNumber!,
                exp: exp!,
                cvv: cvv!,
              ));
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
