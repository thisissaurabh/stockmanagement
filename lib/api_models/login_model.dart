// class LoginResponse {
//   LoginResponse({
//     required this.status,
//     required this.accessToken,
//     required this.user,
//   });
//   late final int status;
//   late final String accessToken;
//   late final User user;
//
//   LoginResponse.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     accessToken = json['access_token'];
//     user = User.fromJson(json['user']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['access_token'] = accessToken;
//     _data['user'] = user.toJson();
//     return _data;
//   }
// }
//
// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.userName,
//     // required this.emailVerifiedAt,
//     required this.companyName,
//     required this.gstNumber,
//     required this.address,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final String email;
//   late final String userName;
//   // late final String emailVerifiedAt;
//   late final String companyName;
//   late final String gstNumber;
//   late final String address;
//   late final String createdAt;
//   late final String updatedAt;
//
//   User.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     userName = json['user_name'];
//     // emailVerifiedAt = null;
//     companyName = json['company_name'];
//     gstNumber = json['gst_number'];
//     address = json['address'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['user_name'] = userName;
//     // _data['email_verified_at'] = emailVerifiedAt;
//     _data['company_name'] = companyName;
//     _data['gst_number'] = gstNumber;
//     _data['address'] = address;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }


class LoginResponse {
  LoginResponse({
    required this.status,
    required this.accessToken,
    required this.user,
  });
  late final int status;
  late final String accessToken;
  late final User user;

  LoginResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    accessToken = json['access_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['access_token'] = accessToken;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.companyName,
    required this.gstNumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String userName;
  late final String companyName;
  late final String gstNumber;
  late final String address;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic>? json){
    if (json != null) {
      id = json['id'] ?? 0; // Set default values or handle null for different types
      name = json['name'] ?? '';
      email = json['email'] ?? '';
      userName = json['user_name'] ?? '';
      // emailVerifiedAt = json['email_verified_at'] ?? ''; // Uncomment if this field exists
      companyName = json['company_name'] ?? '';
      gstNumber = json['gst_number'] ?? '';
      address = json['address'] ?? '';
      createdAt = json['created_at'] ?? '';
      updatedAt = json['updated_at'] ?? '';
    } else {
      // If the JSON is null, assign default values or handle the scenario accordingly
      id = 0;
      name = '';
      email = '';
      userName = '';
      // emailVerifiedAt = '';
      companyName = '';
      gstNumber = '';
      address = '';
      createdAt = '';
      updatedAt = '';
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['user_name'] = userName;
    // _data['email_verified_at'] = emailVerifiedAt;
    _data['company_name'] = companyName;
    _data['gst_number'] = gstNumber;
    _data['address'] = address;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
