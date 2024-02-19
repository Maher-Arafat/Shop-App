part of 'get_cards_cubit.dart';

abstract class GetCardsState {}

class GetCardsInitialState extends GetCardsState {}

class GetCardsSuccessState extends GetCardsState {
  List<CardModel> cardList;

  GetCardsSuccessState({required this.cardList});
}

class GetCardsErrorState extends GetCardsState {}
