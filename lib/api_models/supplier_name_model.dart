class SupplierNameModel {
  int? id;
  String? firstName;
  String? secondName;

  SupplierNameModel({this.id, this.firstName, this.secondName});

  SupplierNameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    return data;
  }
}
