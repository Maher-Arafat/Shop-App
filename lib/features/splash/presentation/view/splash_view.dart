import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/utils/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? lastValidatedToken;
  @override
  void initState() {
    getValidationData();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (lastValidatedToken == null) {
          GoRouter.of(context).pushReplacement(RouterPath.genderView);
        } else {
          GoRouter.of(context).pushReplacement(RouterPath.selectView);
        }
      },
    );
    super.initState();
  }

  getValidationData() async {
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    setState(() {
      lastValidatedToken = token;
    });
  }

  clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Center(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          width: 200,
          height: 200,
          child: Image.asset(
            width: 200,
            height: 200,
            AssetsManager.splashLogo,
          ),
        ),
      ),
    );
  }
}
