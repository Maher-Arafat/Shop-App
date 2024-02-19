import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_up_cubit/sign_up_state.dart';

import '../../../data/repo/sign_up_repo/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.repo}) : super(SignUpInitialState());
  final SignUpRepo repo;
  String? email;
  String? password;
  String? name;
  String? phone;

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    var result = await repo.signUp(
      name!,
      email!,
      password!,
      phone!,
    );
    result.fold((l) => emit(SignUpErrorState(errorMessage: l.errorMessage)),
        (r) => emit(SignUpSuccessState(registerModel: r)));
  }
}
