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
  String? secondName;
  String? email;
  String? phone;
  String? userName;
  String? companyName;
  String? gstNumber;
  String? address;
  String? role;
  String? userAddedBy;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.secondName,
        this.email,
        this.phone,
        this.userName,

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
    name = json['name'].toString();
    secondName = json['second_name'].toString();
    email = json['email'].toString();
    phone = json['phone'].toString();
    userName = json['user_name'].toString();
    companyName = json['company_name'].toString();
    gstNumber = json['gst_number'].toString();
    address = json['address'].toString();
    role = json['role'].toString();
    userAddedBy = json['user_added_by'].toString();
    imageUrl = json['image_url'].toString();
    createdAt = json['created_at'].toString().toString();
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
