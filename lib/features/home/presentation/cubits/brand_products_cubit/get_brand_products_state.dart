import 'package:yallanshop/features/home/data/model/product_model.dart';

abstract class GetBrandProductsState {}

class GetBrandProductsInitialState extends GetBrandProductsState {}

class GetBrandProductsLoadingState extends GetBrandProductsState {}

class GetBrandProductsSuccessState extends GetBrandProductsState {
  final List<ProductDataModel> productList;

  GetBrandProductsSuccessState({required this.productList});
}

class GetBrandProductsErrorState extends GetBrandProductsState {
  final String error;

  GetBrandProductsErrorState({required this.error});
}
