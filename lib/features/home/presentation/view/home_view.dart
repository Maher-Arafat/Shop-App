import 'package:flutter/material.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/home_drawer.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: HomeDrawer(),
      body: HomeViewBody(),
    );
  }
}