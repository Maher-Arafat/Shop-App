import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';

abstract class ProductState {}

class GetProductInitialState extends ProductState {}

class GetProductLoadingState extends ProductState {}

class GetProductSuccessState extends ProductState {
  final List<ProductDataModel> productList;

  GetProductSuccessState({required this.productList});
}

class GetProductErrorState extends ProductState {
  final String errorMessage;

  GetProductErrorState({required this.errorMessage});
}

class GetFavProductLoadingState extends ProductState {}

class GetFavProductSuccessState extends ProductState {
  final List<FavouriteDataModel> productList;

  GetFavProductSuccessState({required this.productList});
}

class GetFavProductErrorState extends ProductState {
  final String errorMessage;

  GetFavProductErrorState({required this.errorMessage});
}

class EditFavProductSuccessState extends ProductState {}
