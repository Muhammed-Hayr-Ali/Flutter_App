class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phoneNumber;
  String? status;
  String? profile;
  String? permissions;
  String? expirationDate;
  String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.status,
      this.profile,
      this.permissions,
      this.expirationDate,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    profile = json['profile'];
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
    data['phone_number'] = phoneNumber;
    data['status'] = status;
    data['profile'] = profile;
    data['permissions'] = permissions;
    data['expiration_date'] = expirationDate;
    data['token'] = token;
    return data;
  }
}
