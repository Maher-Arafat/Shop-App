import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/get_profile_cubit/get_profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final HomeRepo homeRepo;
  ProfileCubit(this.homeRepo) : super(GetProfileInitialState());

  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    var result = await homeRepo.getProfile();
    result.fold((l) {
      emit(GetProfileErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(GetProfileSuccessState(profileModel: r));
    });
  }
}
