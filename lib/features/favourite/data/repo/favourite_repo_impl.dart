import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/favourite/data/repo/favourite_repo.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';

class FavouriteRepoImpl implements FavouriteRepo{
  @override
  Future<Either<Failure, FavouriteModel>> getFavouriteProducts() async{
    FavouriteModel? favouriteModel;
    try {
      await DioHelper.getData(endPoint: "favorites").then((value) {
        favouriteModel = FavouriteModel.fromJson(value.data);
      });
      return right(favouriteModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProducts()async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endPoint: "products").then((value) {
        productModel = ProductModel.fromJson(value.data);
      });
      return right(productModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}