class UserModel {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? userName;
  String? companyName;
  String? role;
  int? userAddedBy;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.userName,
        this.companyName,
        this.role,
        this.userAddedBy,
        this.imageUrl,
        this.createdAt,
        this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    userName = json['user_name'];
    companyName = json['company_name'];
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
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_name'] = this.userName;
    data['company_name'] = this.companyName;
    data['role'] = this.role;
    data['user_added_by'] = this.userAddedBy;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
