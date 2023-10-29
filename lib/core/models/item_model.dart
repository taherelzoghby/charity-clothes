import 'package:donation/core/models/address.dart';

class ItemModel {
  //
  static int id = 0;
  int idProduct = 0;
  String? imageUrl;
  String? pieces;
  String? time;
  String? date;
  String? status;
  Address? address;

  ItemModel({
    required this.date,
    required this.imageUrl,
    required this.status,
    required this.pieces,
    required this.time,
    required this.address,
  }) {
    ++id;
  }
  int get getId => id;
  toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['date'] = date;
    data['pieces'] = pieces;
    data['time'] = time;
    data['status'] = status;
    data['address'] = address!.toJson();
    return data;
  }

  ItemModel.fromJson(json) {
    id = json['id'];
    date = json['date'];
    pieces = json['pieces'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    status = json['status'];
    address = Address.fromJson(json['address']);
    idProduct = id;
  }
}
