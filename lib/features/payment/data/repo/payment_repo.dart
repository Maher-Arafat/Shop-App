import 'package:yallanshop/features/payment/data/model/card_model.dart';

abstract class PaymentRepo {
  Future<void> addCard(CardModel cardModel);
  Future<List<CardModel>> getCardData();
}
