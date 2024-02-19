import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/payment/data/model/card_model.dart';
import 'package:yallanshop/features/payment/data/repo/payment_repo.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  final PaymentRepo paymentRepo;

  AddCardCubit(this.paymentRepo) : super(AddCardInitialState());

  addCard(CardModel cardModel) async {
    try {
      emit(AddCardLoadingState());
      await paymentRepo.addCard(cardModel);
      emit(AddCardSuccessState());
    } on Exception catch (_) {
      emit(AddCardErrorState());
    }
  }
}
