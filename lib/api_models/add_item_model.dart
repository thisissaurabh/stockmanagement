class AddproductData {
  int? status;
  String? message;
  Data? data;

  AddproductData({this.status, this.message, this.data});

  AddproductData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? suppliersId;
  int? userAdd;
  String? purchaseInvoiceNo;
  String? challanNo;
  String? invoiceDate;
  String? codingType;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;

  Data(
      {this.id,
        this.suppliersId,
        this.userAdd,
        this.purchaseInvoiceNo,
        this.challanNo,
        this.invoiceDate,
        this.codingType,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suppliersId = json['suppliers_id'];
    userAdd = json['user_add'];
    purchaseInvoiceNo = json['purchase_invoice_no'];
    challanNo = json['challan_no'];
    invoiceDate = json['invoice_date'];
    codingType = json['coding_type'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['suppliers_id'] = this.suppliersId;
    data['user_add'] = this.userAdd;
    data['purchase_invoice_no'] = this.purchaseInvoiceNo;
    data['challan_no'] = this.challanNo;
    data['invoice_date'] = this.invoiceDate;
    data['coding_type'] = this.codingType;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? purchaseId;
  String? code;
  String? name;
  String? designName;
  String? color;
  String? size;
  String? hsnCode;
  int? quantity;
  String? unit;
  String? purchasePrice;
  String? discount;
  String? tax;
  String? sellMrp;
  String? total;
  String? itemImage;
  String? createdAt;
  String? updatedAt;
  List<Barcode>? barcode;

  Items(
      {this.id,
        this.purchaseId,
        this.code,
        this.name,
        this.designName,
        this.color,
        this.size,
        this.hsnCode,
        this.quantity,
        this.unit,
        this.purchasePrice,
        this.discount,
        this.tax,
        this.sellMrp,
        this.total,
        this.itemImage,
        this.createdAt,
        this.updatedAt,
        this.barcode});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseId = json['purchase_id'];
    code = json['code'];
    name = json['name'];
    designName = json['design_name'];
    color = json['color'];
    size = json['size'];
    hsnCode = json['hsn_code'];
    quantity = json['quantity'];
    unit = json['unit'];
    purchasePrice = json['purchase_price'];
    discount = json['discount'];
    tax = json['tax'];
    sellMrp = json['sell_mrp'];
    total = json['total'];
    itemImage = json['item_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['barcode'] != null) {
      barcode = <Barcode>[];
      json['barcode'].forEach((v) {
        barcode!.add(new Barcode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['purchase_id'] = this.purchaseId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['design_name'] = this.designName;
    data['color'] = this.color;
    data['size'] = this.size;
    data['hsn_code'] = this.hsnCode;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['purchase_price'] = this.purchasePrice;
    data['discount'] = this.discount;
    data['tax'] = this.tax;
    data['sell_mrp'] = this.sellMrp;
    data['total'] = this.total;
    data['item_image'] = this.itemImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.barcode != null) {
      data['barcode'] = this.barcode!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Barcode {
  int? id;
  int? itemId;
  String? code;
  String? iamgeUrl;
  String? createdAt;
  String? updatedAt;

  Barcode(
      {this.id,
        this.itemId,
        this.code,
        this.iamgeUrl,
        this.createdAt,
        this.updatedAt});

  Barcode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    code = json['code'];
    iamgeUrl = json['iamge_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['code'] = this.code;
    data['iamge_url'] = this.iamgeUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
