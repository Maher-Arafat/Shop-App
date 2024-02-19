import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/payment/data/model/card_model.dart';
import 'package:yallanshop/features/payment/data/repo/payment_repo.dart';

part 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  final PaymentRepo paymentRepo;

  GetCardsCubit(this.paymentRepo) : super(GetCardsInitialState());

  void getCards() async {
    try {
      List<CardModel> cardList = await paymentRepo.getCardData();
      emit(GetCardsSuccessState(cardList: cardList));
    } on Exception catch (_) {
      emit(GetCardsErrorState());
    }
  }
}
