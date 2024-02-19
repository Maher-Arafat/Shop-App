import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/register/data/models/register_model.dart';
import 'package:yallanshop/features/register/data/repo/sign_up_repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  RegisterModel? registerModel;
  @override
  Future<Either<Failure, RegisterModel>> signUp(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      await DioHelper.postData(data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }, endPoint: 'register')
          .then((value) {
        registerModel = RegisterModel.fromJson(value.data);
      });
      return right(registerModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
