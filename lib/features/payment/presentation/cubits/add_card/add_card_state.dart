part of 'add_card_cubit.dart';

sealed class AddCardState {}

class AddCardInitialState extends AddCardState {}

class AddCardLoadingState extends AddCardState {}

class AddCardSuccessState extends AddCardState {}

class AddCardErrorState extends AddCardState {}
