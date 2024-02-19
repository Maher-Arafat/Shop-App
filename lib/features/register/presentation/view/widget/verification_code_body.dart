import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.verificationCode,
                  style: StyleManager.headLine1,
                ),
                const SizedBox(height: 68),
                Image.asset(AssetsManager.forgotPasswordImage),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 98,
                      width: 78,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primary,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: StyleManager.headLine1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.lightGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.primary),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 98,
                      width: 78,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primary,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: StyleManager.headLine1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.lightGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.primary),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 98,
                      width: 78,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primary,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: StyleManager.headLine1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.lightGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.primary),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 98,
                      width: 78,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primary,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: StyleManager.headLine1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.lightGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: ColorsManager.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text(
              AppStrings.resendVerificationCode,
              style: StyleManager.subtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 51),
            CustomBottomButton(
              text: AppStrings.confirm,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
