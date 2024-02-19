import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/service_locator.dart';
import 'package:yallanshop/features/payment/data/repo/payment_repo.dart';
import 'package:yallanshop/features/payment/presentation/cubits/get_cards/get_cards_cubit.dart';

import '../../../../../core/resources/app_strings.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCardsCubit(
        di<PaymentRepo>()..getCardData(),
      ),
      child: BlocBuilder<GetCardsCubit, GetCardsState>(
        builder: (context, state) {
          if (state is GetCardsSuccessState) {
            if (state.cardList.isEmpty) {
              return SizedBox(
                height: 185,
                child: Center(
                  child: Text(
                    AppStrings.noCards,
                    style: StyleManager.headLine3,
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 185,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.cardList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Image.asset(AssetsManager.visaCard),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 25),
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  state.cardList[index].name,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 50, left: 20),
                              child: Text(
                                AppStrings.visaClassic,
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                state.cardList[index].cardNumber,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                state.cardList[index].exp,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          } else {
            return Text(
              'There is an Error',
              style: StyleManager.headLine1,
            );
          }
        },
      ),
    );
  }
}
