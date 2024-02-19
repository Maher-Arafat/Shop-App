import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/data/repos/details_repo/details_repo.dart';

import '../../../../../core/utils/api_services.dart';

class DetailsRepoImpl implements DetailsRepo {
  @override
  Future<Either<Failure, ProductModel>> getCategoryProducts({
    required int categoryId,
  }) async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endPoint: 'products?category_id=$categoryId').then((value) {
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
}
