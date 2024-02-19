import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/register/presentation/cubits/google_sign_in_cubit/google_sign_in_state.dart';

import '../../../data/repo/google_signin_repo/google_sign_in_repo.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit({required this.googleRepo})
      : super(GoogleSignInInitialStateState());
  final GoogleRepo googleRepo;
  Future signInWithGoogle() async {
    googleRepo.signInWithGoogle();
  }
}
