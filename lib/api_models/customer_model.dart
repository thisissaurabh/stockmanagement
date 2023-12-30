class CustomerModel {
  int? id;
  int? userId;
  String? customerType;
  String? userCustomerType;
  String? firstName;
  String? secondName;
  String? companyName;
  String? mail;
  int? phone;
  String? work;
  String? otherDetails;
  String? gstNo;
  String? companyAddress;
  String? city;
  String? state;
  int? status;
  String? createdAt;
  String? updatedAt;

  CustomerModel(
      {this.id,
        this.userId,
        this.customerType,
        this.userCustomerType,
        this.firstName,
        this.secondName,
        this.companyName,
        this.mail,
        this.phone,
        this.work,
        this.otherDetails,
        this.gstNo,
        this.companyAddress,
        this.city,
        this.state,
        this.status,
        this.createdAt,
        this.updatedAt});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    customerType = json['customer_type'];
    userCustomerType = json['user_customer_type'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    companyName = json['company_name'];
    mail = json['mail'];
    phone = json['phone'];
    work = json['work'];
    otherDetails = json['other_details'];
    gstNo = json['gst_no'];
    companyAddress = json['company_address'];
    city = json['city'];
    state = json['state'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['customer_type'] = this.customerType;
    data['user_customer_type'] = this.userCustomerType;
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    data['company_name'] = this.companyName;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['work'] = this.work;
    data['other_details'] = this.otherDetails;
    data['gst_no'] = this.gstNo;
    data['company_address'] = this.companyAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
