class AddressModel {
  int? id;
  int? userId;
  String? addressName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? updatedAt;
  String? createdAt;

  AddressModel(
      {this.id,
      this.userId,
      this.addressName,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.country,
      this.postalCode,
      this.updatedAt,
      this.createdAt});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressName = json['address_name'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['address_name'] = addressName;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
