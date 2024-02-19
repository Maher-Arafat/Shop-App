import 'package:get_it/get_it.dart';
import 'package:yallanshop/features/register/data/repo/sign_in_repo/sign_in_repo.dart';
import 'package:yallanshop/features/register/data/repo/sign_in_repo/sign_in_repo_impl.dart';

import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/favourite/data/repo/favourite_repo.dart';
import '../../features/favourite/data/repo/favourite_repo_impl.dart';
import '../../features/home/data/repos/details_repo/details_repo.dart';
import '../../features/home/data/repos/details_repo/details_repo_impl.dart';
import '../../features/home/data/repos/home_repo/home_repo.dart';
import '../../features/home/data/repos/home_repo/home_repo_impl.dart';
import '../../features/payment/data/repo/payment_repo.dart';
import '../../features/payment/data/repo/payment_repo_impl.dart';
import '../../features/register/data/repo/google_signin_repo/google_sign_in_repo.dart';
import '../../features/register/data/repo/google_signin_repo/google_sign_in_repo_impl.dart';

final GetIt di = GetIt.instance;

void servicesLocator() {
  di.registerSingleton<GoogleRepo>(GoogleRepoImpl());
  di.registerSingleton<HomeRepo>(HomeRepoImpl());
  di.registerSingleton<SignInRepo>(SignInRepoImpl());
  di.registerSingleton<DetailsRepo>(DetailsRepoImpl());
  di.registerSingleton<FavouriteRepo>(FavouriteRepoImpl());
  di.registerSingleton<CartRepo>(CartRepoImpl());
  di.registerSingleton<PaymentRepo>(PaymentRepoImpl());
}
