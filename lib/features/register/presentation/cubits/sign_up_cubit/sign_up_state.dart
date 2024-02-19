import 'package:yallanshop/features/register/data/models/register_model.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final RegisterModel registerModel;
  SignUpSuccessState({required this.registerModel});
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}
