abstract class GoogleSignInState {}

class GoogleSignInInitialStateState extends GoogleSignInState {}

class GoogleSignInLoadingStateState extends GoogleSignInState {}

class GoogleSignInSuccessStateState extends GoogleSignInState {}

class GoogleSignInErrorStateState extends GoogleSignInState {
  final String errMessage;
  GoogleSignInErrorStateState({required this.errMessage});
}
