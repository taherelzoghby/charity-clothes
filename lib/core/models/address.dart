// ignore_for_file: public_member_api_docs, sort_constructors_first

class Address {
  String? address;
  String? areaNumber;
  String? lng;
  String? lat;
  String? apartmentNumber;
  Address({
    required this.address,
    required this.areaNumber,
    required this.lng,
    required this.lat,
    required this.apartmentNumber,
  });
  toJson() {
    Map<String, dynamic> data = {};
    data['lng'] = lng;
    data['lat'] = lat;
    data['apartmentNumber'] = apartmentNumber;
    data['areaNumber'] = areaNumber;
    data['address'] = address;
    return data;
  }

  Address.fromJson(json) {
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    apartmentNumber = json['apartmentNumber'];
    areaNumber = json['areaNumber'];
  }
}
