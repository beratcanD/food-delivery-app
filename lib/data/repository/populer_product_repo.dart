import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopulerProductRepo extends GetxService {
  final ApiClient apiClient;
  PopulerProductRepo({required this.apiClient});

  Future<Response> getPopulerProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
