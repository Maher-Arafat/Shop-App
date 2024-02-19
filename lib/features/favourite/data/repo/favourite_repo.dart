import 'package:dartz/dartz.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, FavouriteModel>> getFavouriteProducts();
  Future<Either<Failure, ProductModel>> getProducts();
}
