// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavouriteModel {
  final bool? status;
  final dynamic message;
  final FavouriteData? data;

  FavouriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> map) {
    return FavouriteModel(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? FavouriteData.fromJson(map['data']) : null,
    );
  }
}

class FavouriteData {
  final int? currentPage;
  final List<FavouriteDataModel> data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  FavouriteData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory FavouriteData.fromJson(Map<String, dynamic> json) {
    return FavouriteData(
      currentPage: json['currentPage'],
      data: json['data'] == null
          ? []
          : List<FavouriteDataModel>.from(json['data']!
              .map((elemnt) => FavouriteDataModel.fromJson(elemnt))),
      firstPageUrl: json['firstPageUrl'],
      from: json['from'],
      lastPage: json['lastPage'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      path: json['path'],
      perPage: json['perPage'],
      prevPageUrl: json['prevPageUrl'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class FavouriteDataModel {
  final int? id;
  final Product? product;

  FavouriteDataModel({
    required this.id,
    required this.product,
  });

  factory FavouriteDataModel.fromJson(Map<String, dynamic> json) {
    return FavouriteDataModel(
      id: json['id'],
      product:
          json['product'] == null ? null : Product.fromJson(json['product']),
    );
  }
}

class Product {
  final int? id;
  final double? price;
  final double? oldPrice;
  final double? discount;
  final String? image;
  final String? name;
  final String? description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      price: json["price"].toDouble(),
      oldPrice: json["old_price"].toDouble(),
      discount: json["discount"].toDouble(),
      image: json["image"],
      name: json["name"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
      };
}
