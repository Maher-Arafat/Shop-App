import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanshop/core/failure/failure.dart';
import 'package:yallanshop/core/utils/api_services.dart';
import 'package:yallanshop/features/register/data/models/login_model.dart';
import 'package:yallanshop/features/register/data/repo/sign_in_repo/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  LoginModel? loginModel;

  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required email, required password}) async {
    try {
      await DioHelper.postData(data: {
        'email': email,
        'password': password,
      }, endPoint: 'login')
          .then((value) {
        loginModel = LoginModel.fromJson(value.data);
      });
      return right(loginModel!);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
