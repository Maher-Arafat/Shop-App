import 'package:dartz/dartz.dart';

import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/register/data/models/login_model.dart';

abstract class SignInRepo {
  Future<Either<Failure, LoginModel>> signIn({
    required email,
    required password,
  });
}
