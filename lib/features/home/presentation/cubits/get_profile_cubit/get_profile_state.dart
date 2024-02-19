import 'package:yallanshop/features/home/data/model/profile_model.dart';

abstract class ProfileState {}

class GetProfileInitialState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {
  final ProfileModel profileModel;

  GetProfileSuccessState({required this.profileModel});
}

class GetProfileErrorState extends ProfileState {
  final String errorMessage;

  GetProfileErrorState({required this.errorMessage});

}
