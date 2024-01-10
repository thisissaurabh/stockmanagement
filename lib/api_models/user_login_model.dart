// class UserLoginResponse {
//   int? id;
//   String? name;
//   String? email;
//   int? phone;
//   String? userName;
//   String? companyName;
//   String? address;
//   String? role;
//   int? userAddedBy;
//   String? createdAt;
//   String? updatedAt;
//
//   UserLoginResponse(
//       {this.id,
//         this.name,
//         this.email,
//         this.phone,
//         this.userName,
//         this.companyName,
//         this.address,
//         this.role,
//         this.userAddedBy,
//         this.createdAt,
//         this.updatedAt});
//
//   UserLoginResponse.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     userName = json['user_name'];
//     companyName = json['company_name'];
//     address = json['address'];
//     role = json['role'];
//     userAddedBy = json['user_added_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['user_name'] = this.userName;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['company_name'] = this.companyName;
//     data['gst_number'] = this.gstNumber;
//     data['address'] = this.address;
//     data['role'] = this.role;
//     data['user_added_by'] = this.userAddedBy;
//     data['image_url'] = this.imageUrl;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
