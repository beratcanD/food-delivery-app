import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/populer_product_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/popular_products_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class PopulerProductController extends GetxController {
  final PopulerProductRepo populerProductRepo;
  PopulerProductController({required this.populerProductRepo});

  List<dynamic> _populerProductList = [];
  List<dynamic> get populerProductList => _populerProductList;
  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 1;
  int get quantity => _quantity;
  int _inCardItems = 0;

  int get inCardItems => _inCardItems + _quantity;
  Future<void> getPopulerProductList() async {
    Response response = await populerProductRepo.getPopulerProductList();
    if (response.statusCode == 200) {
      print("got products");
      _populerProductList = [];
      _populerProductList.addAll(Product.fromJson(response.body).products);
      //print(_populerProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCardItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      return 0;
    } else if ((_inCardItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCardItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // if exist
    // get from storage _inCardItems
    print("exist or not " + exist.toString());
    if (exist) {
      _inCardItems = _cart.getQuantity(product);
    }
    print("the quantity in the cart is " + _inCardItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCardItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print(value.id.toString() + "   " + value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
