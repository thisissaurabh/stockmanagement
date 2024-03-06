class SalesPersonModel {
  int? id;
  int? userId;
  String? name;
  String? email;
  int? phone;
  String? photo;
  String? createdAt;
  String? updatedAt;

  SalesPersonModel(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.createdAt,
        this.updatedAt});

  SalesPersonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
