import 'package:yallanshop/features/register/data/models/login_model.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  LoginModel loginModel;
  SignInSuccessState({required this.loginModel});
}

class SignInErrorState extends SignInState {
  String errorMessage;
  SignInErrorState({required this.errorMessage});
}
