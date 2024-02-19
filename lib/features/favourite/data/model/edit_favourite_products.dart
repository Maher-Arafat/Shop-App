class EditFavouriteModel {
  final bool? status;
  final String? message;

  EditFavouriteModel({
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory EditFavouriteModel.fromJson(Map<String, dynamic> json) {
    return EditFavouriteModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
