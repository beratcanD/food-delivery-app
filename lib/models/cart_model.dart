import 'package:food_delivery_app/models/popular_products_model.dart';

class CartModel {
  int? id;
  String? name;
  String? time;
  int? price;
  int? quantity;
  String? img;
  bool? isExist;
  ProductModel? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.time,
      this.isExist,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json["quantity"];
    price = json['price'];
    isExist = json["isExist"];
    img = json['img'];
    time = json["time"];
    product = ProductModel.fromJson(json["product"]);
  }
}
