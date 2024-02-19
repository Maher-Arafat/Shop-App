import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/utils/service_locator.dart';
import 'package:yallanshop/features/address/presentation/view/address_view.dart';
import 'package:yallanshop/features/cart/data/repo/cart_repo.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:yallanshop/features/cart/presentation/view/cart_view.dart';
import 'package:yallanshop/features/cart/presentation/view/order_confirmed_view.dart';
import 'package:yallanshop/features/details/presentation/view/details_view.dart';
import 'package:yallanshop/features/favourite/presentation/view/favourite_view.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_cubit/get_brand_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:yallanshop/features/home/presentation/view/brand_view.dart';
import 'package:yallanshop/features/home/presentation/view/home_view.dart';
import 'package:yallanshop/features/home/presentation/view/select_screen.dart';
import 'package:yallanshop/features/payment/presentation/view/add_card_screen.dart';
import 'package:yallanshop/features/payment/presentation/view/payment_view.dart';
import 'package:yallanshop/features/register/presentation/view/fogot_password_view.dart';
import 'package:yallanshop/features/register/presentation/view/get_started_view.dart';
import 'package:yallanshop/features/register/presentation/view/sign_in_view.dart';
import 'package:yallanshop/features/register/presentation/view/sign_up_view.dart';
import 'package:yallanshop/features/register/presentation/view/verification_code_view.dart';
import 'package:yallanshop/features/splash/presentation/view/gender_view.dart';
import 'package:yallanshop/features/splash/presentation/view/splash_view.dart';

class RouterPath {
  static const String splashView = '/';
  static const String genderView = '/gender';
  static const String getStartedView = '/getStarted';
  static const String signUpView = '/signUpView';
  static const String signInView = '/signInView';
  static const String homeView = '/homeView';
  static const String detailsView = '/detailsView';
  static const String brandView = '/brandView';
  static const String favouriteView = '/favouriteView';
  static const String cartView = '/cartView';
  static const String selectView = '/selectView';
  static const String paymentView = '/paymentView';
  static const String orderConfirmedView = '/orderConfirmedView';
  static const String AddCardView = '/AddCardView';
  static const String forgotPasswordView = '/forgotPasswordView';
  static const String addresView = '/orderConfirmedView';
  static const String verificationCodeView = '/verificationCodeView';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.splashView,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterPath.genderView,
      builder: (context, state) => const GenderView(),
    ),
    GoRoute(
      path: RouterPath.getStartedView,
      builder: (context, state) => const GetStartedView(),
    ),
    GoRoute(
      path: RouterPath.signInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: RouterPath.signUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: RouterPath.homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouterPath.brandView,
      builder: (context, state) => BrandView(
        brand: state.extra as CategoryDataModel,
      ),
    ),
    GoRoute(
      path: RouterPath.detailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => CartCubit(di<CartRepo>()),
        child: DetailsView(
          product: state.extra as ProductDataModel,
        ),
      ),
    ),
    GoRoute(
      path: RouterPath.favouriteView,
      builder: (context, state) => const FavouriteView(),
    ),
    GoRoute(
      path: RouterPath.selectView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProfileCubit(di<HomeRepo>())..getProfile()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(
              create: (context) => GetBrandCubit(di<HomeRepo>())..getBrand()),
          BlocProvider(
            create: (context) => CartCubit(di<CartRepo>()),
          ),
        ],
        child: const SelectScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.cartView,
      builder: (context, state) => BlocProvider(
        create: (context) => CartCubit(di<CartRepo>())..getCartProducts(),
        child: const CartView(),
      ),
    ),
    GoRoute(
      path: RouterPath.paymentView,
      builder: (context, state) => const PaymentView(),
    ),
    GoRoute(
      path: RouterPath.orderConfirmedView,
      builder: (context, state) => const OrderConfirmedView(),
    ),
    GoRoute(
      path: RouterPath.AddCardView,
      builder: (context, state) => const AddCardView(),
    ),
    GoRoute(
      path: RouterPath.forgotPasswordView,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: RouterPath.addresView,
      builder: (context, state) => const AddressView(),
    ),
    GoRoute(
      path: RouterPath.verificationCodeView,
      builder: (context, state) => const VerificationCodeView(),
    ),
  ],
);
