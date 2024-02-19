import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanshop/bloc_observer.dart';
import 'package:yallanshop/core/shared/constants.dart';
import 'package:yallanshop/core/utils/service_locator.dart';
import 'package:yallanshop/features/address/presentation/cubits/address_cubit.dart';
import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/payment/data/model/card_model.dart';
import 'package:yallanshop/features/payment/presentation/cubits/payment/payment_cubit.dart';
import 'package:yallanshop/firebase_options.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CardModelAdapter());
  await Hive.openBox<CardModel>(kCardsBox);
  Bloc.observer = MyBlocObserver();
  servicesLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(di<HomeRepo>()),
        ),
        BlocProvider(create: (context) => PaymentCubit()),
        BlocProvider(create: (context) => AddressCubit()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
