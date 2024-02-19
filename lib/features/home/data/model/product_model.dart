class ProductModel {
  ProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final ProductData? data;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProductData {
  ProductData({
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

  final int? currentPage;
  final List<ProductDataModel> data;
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

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      currentPage: json["current_page"],
      data: json["data"] == null
          ? []
          : List<ProductDataModel>.from(
              json["data"]!.map((item) => ProductDataModel.fromJson(item))),
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data.map((item) => item.toJson()).toList(),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int? id;
  final double? price;
  final double? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String> images;
  final bool? inFavorites;
  final bool? inCart;

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json["id"],
      price: json["price"].toDouble(),
      oldPrice: json["old_price"].toDouble(),
      discount: json["discount"],
      image: json["image"],
      name: json["name"],
      description: json["description"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((item) => item)),
      inFavorites: json["in_favorites"],
      inCart: json["in_cart"],
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
        "images": images.map((item) => item).toList(),
        "in_favorites": inFavorites,
        "in_cart": inCart,
      };
}
