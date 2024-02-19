// ignore_for_file: public_member_api_docs, sort_constructors_first

class ReviewsModel {
  String? name;
  String? image;
  num? rating;
  String? review;
  DateTime? time;
  ReviewsModel({
    this.name,
    this.image,
    this.rating,
    this.review,
    this.time,
  });
  ReviewsModel.fromJson(dynamic json) {
    name = json['name'] ?? " ";
    image = json['image'] ?? " ";
    rating = json['rating'] ?? 0;
    review = json['review'] ?? " ";
    time = json['time'].toDate() ?? DateTime(DateTime.february);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['rating'] = rating;
    map['review'] = review;
    map['time'] = time;
    return map;
  }
}
