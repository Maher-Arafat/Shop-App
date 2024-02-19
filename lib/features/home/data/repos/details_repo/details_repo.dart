import 'package:dartz/dartz.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';

import '../../../../../core/failure/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, ProductModel>> getCategoryProducts(
      {required int categoryId});
}
