// ignore_for_file: public_member_api_docs, sort_constructors_first

class BrandModel {
  String? name;
  String? image;
  int? id;
  BrandModel({
    this.name,
    this.image,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name ?? " ",
      'image': image ?? " ",
      'id': id ?? 0,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
    );
  }
}
