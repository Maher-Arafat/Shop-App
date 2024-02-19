abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {}

class ItemCountEncrementState extends CartState {}

class ItemCountDecrementState extends CartState {}

class AddOrRemoveProductLoadingState extends CartState {}

class AddOrRemoveProductSuccessState extends CartState {}

class AddAddressSuccessState extends CartState {}
