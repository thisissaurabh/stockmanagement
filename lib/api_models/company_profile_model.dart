class CompanyProfileModel {
  int? status;
  String? message;
  User? user;

  CompanyProfileModel({this.status, this.message, this.user});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? secondName;
  String? email;
  Null? phone;
  String? userName;
  Null? emailVerifiedAt;
  String? companyName;
  String? gstNumber;
  String? address;
  String? role;
  Null? userAddedBy;
  Null? imageUrl;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.secondName,
        this.email,
        this.phone,
        this.userName,
        this.emailVerifiedAt,
        this.companyName,
        this.gstNumber,
        this.address,
        this.role,
        this.userAddedBy,
        this.imageUrl,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    secondName = json['second_name'];
    email = json['email'];
    phone = json['phone'];
    userName = json['user_name'];
    emailVerifiedAt = json['email_verified_at'];
    companyName = json['company_name'];
    gstNumber = json['gst_number'];
    address = json['address'];
    role = json['role'];
    userAddedBy = json['user_added_by'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['second_name'] = this.secondName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_name'] = this.userName;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['company_name'] = this.companyName;
    data['gst_number'] = this.gstNumber;
    data['address'] = this.address;
    data['role'] = this.role;
    data['user_added_by'] = this.userAddedBy;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
