class UserAddress {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  String? country;
  String? state;
  String? city;
  String? addressLine1;
  String? addressLine2;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;

  UserAddress(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.country,
      this.state,
      this.city,
      this.addressLine1,
      this.addressLine2,
      this.phoneNumber,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id']??'';
    firstName = json['first_name']??'';
    lastName = json['last_name']??'';
    country = json['country']??'';
    state = json['state']??'';
    city = json['city']??'';
    addressLine1 = json['address_line_1']??'';
    addressLine2 = json['address_line_2']??'';
    phoneNumber = json['phone_number']??'';
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['phone_number'] = phoneNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
