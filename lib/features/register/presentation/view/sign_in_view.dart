import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/register/data/repo/sign_in_repo/sign_in_repo_impl.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:yallanshop/features/register/presentation/view/widget/sign_in_view_body.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(repo: SignInRepoImpl()),
      child: const Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
