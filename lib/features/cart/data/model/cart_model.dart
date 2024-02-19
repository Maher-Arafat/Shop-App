// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:yallanshop/features/home/data/model/product_model.dart';

class CartModel {
  CartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final CartDataModel? data;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : CartDataModel.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CartDataModel {
  CartDataModel({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  final List<CartItem> cartItems;
  final double? subTotal;
  final double? total;

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      cartItems: json["cart_items"] == null
          ? []
          : List<CartItem>.from(
              json["cart_items"]!.map((x) => CartItem.fromJson(x))),
      subTotal: json["sub_total"].toDouble(),
      total: json["total"].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "cart_items": cartItems.map((x) => x.toJson()).toList(),
        "sub_total": subTotal,
        "total": total,
      };
}

class CartItem {
  final int? id;
  final int? quantity;
  final ProductDataModel? product;
  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'product': product?.toJson(),
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] != null ? json['id'] as int : null,
      quantity: json['quantity'] != null ? json['quantity'] as int : null,
      product: json['product'] == null
          ? null
          : ProductDataModel.fromJson(json['product']),
    );
  }
}

class CartProduct {
  final int? id;
  final int? price;
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String> images;
  final bool? inFav;
  final bool? inCart;

  CartProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFav,
    required this.inCart,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favourites': inFav,
      'in_cart': inCart,
    };
  }

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images:json['images']==null?[]: List<String>.from((json['images']!.map((item) => item))),
      inFav: json['in_favourites'],
      inCart: json['in_cart'],
    );
  }
}
