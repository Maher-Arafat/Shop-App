// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:convert';

class RegisterModel {
  final bool? status;
  final String? message;
  final Data? data;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );
  }
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int id;
  String name;
  String phone;
  String image;
  String email;
  String token;
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
      'email': email,
      'token': token,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }
}
