import 'package:yallanshop/features/home/data/model/category_model.dart';

abstract class GetBrandState {}

class GetBrandInitialState extends GetBrandState {}

class GetBrandLoadingState extends GetBrandState {}

class GetBrandSuccessState extends GetBrandState {
  final List<CategoryDataModel> brandList;

  GetBrandSuccessState({required this.brandList});
}

class GetBrandErrorState extends GetBrandState {
  final String error;

  GetBrandErrorState({required this.error});
}
