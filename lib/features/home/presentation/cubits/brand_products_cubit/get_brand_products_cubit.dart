import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/home/data/repos/details_repo/details_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_products_cubit/get_brand_products_state.dart';

class GetBrandProductsCubit extends Cubit<GetBrandProductsState> {
  GetBrandProductsCubit(this.detailsRepo)
      : super(GetBrandProductsInitialState());
  final DetailsRepo detailsRepo;

  Future<void> getBrandProducts({required int categoryId}) async {
    emit(GetBrandProductsInitialState());
    var result = await detailsRepo.getCategoryProducts(categoryId: categoryId);
    result.fold((l) {
      emit(GetBrandProductsErrorState(error: l.errorMessage));
    }, (r) {
      emit(GetBrandProductsSuccessState(productList: r.data!.data));
    });
  }
}
