import 'package:hive_flutter/adapters.dart';
import 'package:yallanshop/core/shared/constants.dart';
import 'package:yallanshop/features/payment/data/model/card_model.dart';
import 'package:yallanshop/features/payment/data/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  @override
  Future<void> addCard(CardModel cardModel) async {
    var notesBox = Hive.box<CardModel>(kCardsBox);
    await notesBox.add(cardModel);
  }

  @override
  Future<List<CardModel>> getCardData() async {
    var cardBox = Hive.box<CardModel>(kCardsBox);
    List<CardModel> cardList = cardBox.values.toList();
    return cardList;
  }
}
