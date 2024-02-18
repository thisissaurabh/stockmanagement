class BarcodeModel {
  String? date;
  String? codingType;
  String? itemName;
  int? quantity;
  List<Barcodes>? barcodes;

  BarcodeModel(
      {this.date,
        this.codingType,
        this.itemName,
        this.quantity,
        this.barcodes});

  BarcodeModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    codingType = json['coding_type'];
    itemName = json['item_name'];
    quantity = json['quantity'];
    if (json['barcodes'] != null) {
      barcodes = <Barcodes>[];
      json['barcodes'].forEach((v) {
        barcodes!.add(new Barcodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['coding_type'] = this.codingType;
    data['item_name'] = this.itemName;
    data['quantity'] = this.quantity;
    if (this.barcodes != null) {
      data['barcodes'] = this.barcodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Barcodes {
  String? barcodeNo;
  String? imageUrl;

  Barcodes({this.barcodeNo, this.imageUrl});

  Barcodes.fromJson(Map<String, dynamic> json) {
    barcodeNo = json['barcode_no'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode_no'] = this.barcodeNo;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
