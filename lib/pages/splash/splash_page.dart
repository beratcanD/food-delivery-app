import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../../controllers/populer_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResource() async {
    await Get.find<PopulerProductController>().getPopulerProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    Timer(Duration(seconds: 6), () => Get.offNamed(RouteHelper.getInitial()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.network(
                  "https://img.freepik.com/premium-vector/food-delivery-logo-template-design_316488-538.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
