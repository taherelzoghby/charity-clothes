// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  String? name;
  String? id;
  String? phone;
  String? deviceToken;
  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.id,
    required this.phone,
    required this.deviceToken,
  });

  toJson() {
    Map<String, dynamic> data = {};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['deviceToken'] = deviceToken;
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }

  UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    id = json['id'];
    phone = json['phone'];
    deviceToken = json['deviceToken'];
  }
}
