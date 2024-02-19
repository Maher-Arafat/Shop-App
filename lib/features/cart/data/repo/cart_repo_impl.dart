import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/cart/data/model/cart_model.dart';
import 'package:yallanshop/features/cart/data/repo/cart_repo.dart';
import 'package:yallanshop/features/favourite/data/model/edit_favourite_products.dart';

class CartRepoImpl extends CartRepo {
  @override
  Future<Either<Failure, EditFavouriteModel>> addCartData(
      {required productId}) async {
    EditFavouriteModel? addToCartModel;

    try {
      await DioHelper.postData(
        data: {'product_id': productId},
        endPoint: 'carts',
      ).then((value) {
        addToCartModel = EditFavouriteModel.fromJson(value.data);
      });
      return right(addToCartModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCartData() async {
    CartModel? cartModel;

    try {
      await DioHelper.getData(endPoint: 'carts').then((value) {
        cartModel = CartModel.fromJson(value.data);
      });
      return right(cartModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
