import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/features/address/presentation/cubits/address_cubit.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../register/presentation/view/widget/custom_bottom_button.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  final _formKy = GlobalKey<FormState>();
  String? name;
  String? country;
  String? city;
  String? number;
  String? address;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKy,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.name,
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
                        validator: (value) =>
                            (value!.isEmpty) ? AppStrings.fieldRequired : null,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.country,
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
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) => country = value,
                              validator: (value) =>
                                  (value!.isEmpty) ? AppStrings.fieldRequired : null,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.city,
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
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) => city = value,
                              validator: (value) =>
                                  (value!.isEmpty) ? AppStrings.fieldRequired : null,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.phone,
                        style: StyleManager.headLine3,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        maxLength: 10,
                        cursorColor: ColorsManager.primary,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorsManager.darkWhite,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => number = value,
                        validator: (value) => (value!.isEmpty)
                            ? AppStrings.fieldRequired
                            : (value.length < 10)
                                ? AppStrings.minLength10
                                : null,
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.address,
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
                            onChanged: (value) => address = value,
                            validator: (value) =>
                                (value!.isEmpty) ? AppStrings.fieldRequired : null,
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
                ],
              ),
            ),
          ),
        ),
        CustomBottomButton(
          text: AppStrings.saveAddress,
          onPressed: () {
            if (_formKy.currentState!.validate()) {
              BlocProvider.of<AddressCubit>(context).setAddessData(
                name: name!,
                country: country!,
                city: city!,
                number: number!,
                address: address!,
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
