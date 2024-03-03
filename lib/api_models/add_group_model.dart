class AddGroupModel {
  AddGroupModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Data data;

  AddGroupModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userId,
    required this.groupName,
    required this.id,
  });
  late final int userId;
  late final String groupName;
  late final int id;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    groupName = json['group_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['group_name'] = groupName;
    _data['id'] = id;
    return _data;
  }
}