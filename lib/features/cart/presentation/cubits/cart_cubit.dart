// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/shared/shared.dart';

import 'package:yallanshop/features/cart/data/model/cart_model.dart';
import 'package:yallanshop/features/cart/data/repo/cart_repo.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartModel? cartModel;
  String? editCartMessage;
  double? subTotl;
  int? itemCount;
  CartCubit(this.cartRepo) : super(CartInitialState());

  Future<void> getCartProducts() async {
    emit(CartLoadingState());
    var result = await cartRepo.getCartData();
    result.fold((l) {
      l.errorMessage;
      emit(CartErrorState());
    }, (r) {
      emit(CartSuccessState());
      cartModel = r;
      subTotl = r.data!.subTotal!.toDouble();
    });
  }

  Future<void> addOrRemoveProduct({required productId}) async {
    inCartMap[productId] = !inCartMap[productId]!;
    emit(AddOrRemoveProductLoadingState());
    var result = await cartRepo.addCartData(productId: productId);
    result.fold((l) {
      l.errorMessage;
    }, (r) {
      emit(AddOrRemoveProductSuccessState());
      getCartProducts();
      editCartMessage = r.message;
    });
  }

  itemCountIncrement(int idx) {
    itemCount = cartModel!.data!.cartItems[idx].quantity;
    itemCount = itemCount! + 1;
    emit(ItemCountEncrementState());
    return itemCount;
  }

  itemCountDecrement(int idx) {
    itemCount = cartModel!.data!.cartItems[idx].quantity;
    itemCount = itemCount! - 1;
    emit(ItemCountDecrementState());
    return itemCount;
  }
}
