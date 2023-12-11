class UserProfile {
  int? id;
  String? name;
  String? email;
  String? status;
  String? phoneNumber;
  String? permissions;
  String? accountStatus;
  bool? emailVerifiedAt;
  String? profilePhotoPath;
  String? profileUrl;

  UserProfile({
    this.id,
    this.name,
    this.email,
    this.status,
    this.phoneNumber,
    this.permissions,
    this.accountStatus,
    this.emailVerifiedAt,
    this.profilePhotoPath,
    this.profileUrl,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    status = json['status'] ?? '';
    phoneNumber = json['phone_number'] ?? '';
    permissions = json['permissions'];
    accountStatus = json['account_status'];
    emailVerifiedAt = json['email_verified_at'];
    profilePhotoPath = json['profile_photo_path'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['status'] = status;
    data['phone_number'] = phoneNumber;
    data['permissions'] = permissions;
    data['account_status'] = accountStatus;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_photo_path'] = profilePhotoPath;
    data['profile_url'] = profileUrl;
    return data;
  }
}
