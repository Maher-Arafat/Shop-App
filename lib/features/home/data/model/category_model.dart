// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  bool? status;
  dynamic message;
  CategoryData? data;

  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : CategoryData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class CategoryData {
  int? currentPage;
  List<CategoryDataModel>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CategoryData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        lastPageUrl: json['last_page_url'] as String?,
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
}

class CategoryDataModel {
  int? id;
  String? name;
  String? image;

  CategoryDataModel({this.id, this.name, this.image});

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
