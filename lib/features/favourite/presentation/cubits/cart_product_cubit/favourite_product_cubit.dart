import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/favourite/data/repo/favourite_repo.dart';
import 'package:yallanshop/features/favourite/presentation/cubits/cart_product_cubit/favourite_product_state.dart';

class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  FavouriteProductCubit(this.favouriteRepo)
      : super(FavouriteProductInitialState());
  final FavouriteRepo favouriteRepo;

  Future<void> getFavouriteProducts() async {
    emit(FavouriteProductLoadingState());
    var result = await favouriteRepo.getFavouriteProducts();
    result.fold((l) {
      emit(FavouriteProductErrorState(error: l.errorMessage));
    }, (r) {
      emit(FavouriteProductSuccessState(productList: r.data!.data));
    });
  }
}
