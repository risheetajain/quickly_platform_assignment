class ProductModel {
  String? sId;
  String? name;
  String? description;
  int? price;
  int? iV;

  ProductModel(
      {this.sId, this.name, this.description, this.price, this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['__v'] = iV;
    return data;
  }
}
