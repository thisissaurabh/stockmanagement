class GetBrandModel {
  int? id;
  int? groupId;
  String? brandName;
  String? createdAt;
  String? updatedAt;

  GetBrandModel(
      {this.id, this.groupId, this.brandName, this.createdAt, this.updatedAt});

  GetBrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    brandName = json['brand_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['brand_name'] = this.brandName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
