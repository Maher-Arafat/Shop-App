import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';

abstract class FavouriteProductState {}

class FavouriteProductInitialState extends FavouriteProductState {}

class FavouriteProductLoadingState extends FavouriteProductState {}

class FavouriteProductSuccessState extends FavouriteProductState {
  final List<FavouriteDataModel> productList;

  FavouriteProductSuccessState({required this.productList});
}

class FavouriteProductErrorState extends FavouriteProductState {
  final String error;

  FavouriteProductErrorState({required this.error});
}
