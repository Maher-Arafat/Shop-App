import 'package:dartz/dartz.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/cart/data/model/cart_model.dart';
import 'package:yallanshop/features/favourite/data/model/edit_favourite_products.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCartData();
  Future<Either<Failure, EditFavouriteModel>> addCartData({required productId});
}
