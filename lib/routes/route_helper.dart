import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_page_detail.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/food/recomended_food_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static String splashPage = "/splash-page";

  static String getInitial() => "$initial";
  static String getRecommended(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";
  static String getSplashPage() => "$splashPage";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          print("popular food get called");
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return RecomendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
