import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWitdh = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.10;
  static double pageViewTextContainer = screenHeight / 5.69;
  static double pageView = screenHeight / 2.13;
// dynamic height padding and margin
  static double height10 = screenHeight / 68.3;
  static double height20 = screenHeight / 34.15;
  static double height15 = screenHeight / 45.53;
  static double height45 = screenHeight / 15.17;
  static double height30 = screenHeight / 22.76;
// dynamic width padding and margin
  static double width10 = screenHeight / 68.3;
  static double width20 = screenHeight / 34.15;
  static double width15 = screenHeight / 45.53;
  static double width30 = screenHeight / 22.76;
// fonst size
  static double font20 = screenHeight / 34.15;
  static double font26 = screenHeight / 26.26;
  static double font16 = screenHeight / 42.68;
// radius
  static double radius20 = screenHeight / 34.15;
  static double radius30 = screenHeight / 22.76;
  static double radius15 = screenHeight / 45.53;

// icon size

  static double iconSize24 = screenHeight / 28.45;
  static double iconSize16 = screenHeight / 42.68;
  static double iconSize36 = screenHeight / 18.88;

// list view size

  static double listViewImgSize = screenHeight / 5.69;
  static double listViewTextContSize = screenHeight / 6.83;

// popular food
  static double popularFoodImgSize = screenHeight / 1.95;

// bottom height
  static double bottomHeightBar = screenHeight / 5.69;
}
