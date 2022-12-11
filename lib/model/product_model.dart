


import 'dart:convert';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ProductModel {
  int? id;
  String? name;
  double? price;
  int? noInStock;
  bool? isAvailable;

  ProductModel(
      {this.id, this.name, this.price, this.noInStock, this.isAvailable});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toDouble();
    noInStock = json['noInStock'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['noInStock'] = this.noInStock;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

class UserModel {
  String? message;

  UserModel({this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}