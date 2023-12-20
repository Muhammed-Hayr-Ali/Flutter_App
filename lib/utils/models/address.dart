class AddressModel {
  String? addressName;
  String? country;
  String? state;
  String? city;
  String? addressLine1;
  String? addressLine2;
  String? countryCode;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddressModel(
      {this.addressName,
      this.country,
      this.state,
      this.city,
      this.addressLine1,
      this.addressLine2,
      this.countryCode,
      this.phoneNumber,
      this.latitude,
      this.longitude,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_name'] = addressName;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
