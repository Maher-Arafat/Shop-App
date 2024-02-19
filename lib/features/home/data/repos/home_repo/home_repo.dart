import 'package:dartz/dartz.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/data/model/profile_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, ProductModel>> getProducts();
  Future<Either<Failure, CategoryModel>> getBrand();
  Future<Either<Failure, FavouriteModel>> getFavoriteProducts();
  Future<List<ProductModel>> getCartProducts();
  Future<List<ProductModel>> getBrandProducts(String brand);
}
