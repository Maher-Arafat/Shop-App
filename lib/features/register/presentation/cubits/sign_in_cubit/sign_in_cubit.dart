import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/register/data/repo/sign_in_repo/sign_in_repo.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.repo}) : super(SignInInitialState());
  final SignInRepo repo;
  late String email;
  late String password;

  Future<void> signIn() async {
    emit(SignInLoadingState());
    var result = await repo.signIn(
      email: email,
      password: password,
    );
    result.fold((l) => emit(SignInErrorState(errorMessage: l.errorMessage)),
        (r) => emit(SignInSuccessState(loginModel: r)));
  }
}
