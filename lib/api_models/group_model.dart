class GroupModel {
  int? id;
  int? userId;
  String? groupName;

  GroupModel({this.id, this.userId, this.groupName});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    groupName = json['group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['group_name'] = this.groupName;
    return data;
  }
}
