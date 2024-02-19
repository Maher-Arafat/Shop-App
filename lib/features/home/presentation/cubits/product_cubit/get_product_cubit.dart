// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/shared/shared.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';

import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this.homeRepo,
  ) : super(GetProductInitialState());
  final HomeRepo homeRepo;
  List<ProductDataModel>? productList;
  List<FavouriteDataModel>? favProductList;

  Future<void> getProducts() async {
    emit(GetProductInitialState());
    var result = await homeRepo.getProducts();
    result.fold((l) {
      emit(GetProductErrorState(errorMessage: l.errorMessage));
    }, (r) {
      for (var element in r.data!.data) {
        inCartMap.addAll({element.id!: element.inCart!});
        inFavorite.addAll({
          element.id!: element.inFavorites!,
        });
      }
      productList = r.data!.data;
      emit(GetProductSuccessState(productList: r.data!.data));
    });
  }

  Future<void> getFaouvriteProducts() async {
    emit(GetFavProductLoadingState());
    var result = await homeRepo.getFavoriteProducts();
    result.fold((l) {
      emit(GetFavProductErrorState(errorMessage: l.errorMessage));
    }, (r) {
      favProductList = r.data!.data;
      emit(GetFavProductSuccessState(productList: r.data!.data));
    });
  }

  Future<void> editFavProductsFromHome(int productId) async {
    emit(EditFavProductSuccessState());
    inFavorite[productId] = !inFavorite[productId]!;
    await DioHelper.postData(
      data: {"product_id": productId},
      endPoint: 'favorites',
    ).then((value) {
      getFaouvriteProducts();
    }).catchError((error) {});
  }

  Future<void> editFavProductsFromHomeFavs(int productId) async {
    inFavorite[productId] = !inFavorite[productId]!;
    await DioHelper.postData(
      data: {"product_id": productId},
      endPoint: 'favorites',
    ).then((value) {
      emit(EditFavProductSuccessState());
      getFaouvriteProducts();
    }).catchError((error) {});
  }
}
