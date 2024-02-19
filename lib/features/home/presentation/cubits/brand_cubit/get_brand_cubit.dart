import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/home/data/repos/home_repo/home_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_cubit/get_brand_state.dart';

class GetBrandCubit extends Cubit<GetBrandState> {
  final HomeRepo homeRepo;

  GetBrandCubit(this.homeRepo) : super(GetBrandInitialState());
  Future<void> getBrand() async {
    emit(GetBrandLoadingState());
    var result = await homeRepo.getBrand();
    result.fold((l) => emit(GetBrandErrorState(error: l.errorMessage)), (r) {
      var data = r.data!.data;
      emit(GetBrandSuccessState(brandList: data!));
    });
  }
}
