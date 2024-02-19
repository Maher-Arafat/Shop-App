import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/data/model/profile_model.dart';
import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, CategoryModel>> getBrand() async {
    CategoryModel? categoryModel;
    try {
      await DioHelper.getData(endPoint: 'categories').then((value) {
        categoryModel = CategoryModel.fromJson(value.data);
      });
      return right(categoryModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<List<ProductModel>> getBrandProducts(String brand) async {
    List<ProductModel> productsList = [];
    try {
      productsList.clear();
      await FirebaseFirestore.instance
          .collection('products')
          .where('brand')
          .get();

      return productsList;
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print('There is an Error ${error.code} : ${error.message}');
      }
      return productsList;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<ProductModel>> getCartProducts() async {
    List<ProductModel> productsList = [];
    try {
      productsList.clear();
      await FirebaseFirestore.instance
          .collection('products')
          .where('id', whereIn: [AppStrings.testProductId]).get();

      return productsList;
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print('There is an Error ${error.code} : ${error.message}');
      }
      return productsList;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<Either<Failure, FavouriteModel>> getFavoriteProducts() async {
    FavouriteModel? favoriteModel;
    try {
      await DioHelper.getData(endPoint: 'favorites').then((value) {
        favoriteModel = FavouriteModel.fromJson(value.data);
      });
      return right(favoriteModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProducts() async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endPoint: 'products').then((value) {
        productModel = ProductModel.fromJson(value.data);
      });
      return right(productModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    ProfileModel? profileModel;
    try {
      await DioHelper.getData(endPoint: 'profile').then((value) {
        profileModel = ProfileModel.fromJson(value.data);
      });
      return right(profileModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
