import 'package:dartz/dartz.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/features/register/data/models/register_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, RegisterModel>> signUp(
    String name,
    String email,
    String password,
    String phone,
  );
}
