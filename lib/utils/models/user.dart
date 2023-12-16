class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? countryCode;
  String? phoneNumber;
  String? gender;
  String? dateBirth;
  String? profile;
  String? status;
  String? permissions;
  String? expirationDate;
  String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.countryCode,
      this.phoneNumber,
      this.gender,
      this.dateBirth,
      this.profile,
      this.status,
      this.permissions,
      this.expirationDate,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    dateBirth = json['date_birth'];
    profile = json['profile']??'';
    status = json['status'];
    permissions = json['permissions'];
    expirationDate = json['expiration_date'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['date_birth'] = dateBirth;
    data['profile'] = profile??'';
    data['status'] = status;
    data['permissions'] = permissions;
    data['expiration_date'] = expirationDate;
    data['token'] = token;
    return data;
  }
}
