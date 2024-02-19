import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/register/presentation/view/widget/get_started_view_body.dart';

import '../../data/repo/google_signin_repo/google_sign_in_repo_impl.dart';
import '../cubits/google_sign_in_cubit/google_sign_in_cubit.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(
        googleRepo: GoogleRepoImpl(),
      ),
      child: const Scaffold(
        body: GetStartedViewBody(),
      ),
    );
  }
}
