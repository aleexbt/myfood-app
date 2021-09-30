import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:myfood_delivery/models/product_model.dart';

class MainController extends GetxController {
  Rx<Product> _product = Product().obs;
  RxBool _isLoading = true.obs;
  RxBool _hasError = false.obs;

  Product get product => _product.value;
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    // findOne();
    super.onInit();
  }

  void findOne() async {
    try {
      d.Dio dio = d.Dio();
      d.Response response = await dio.get(
          'http://192.168.1.71:3000/product/66b557ee-33e9-424b-ad1f-bee87b35efe8');
      Product product = Product.fromJson(response.data);
      _product.value = product;
    } catch (err) {
      _hasError.value = true;
    } finally {
      _isLoading.value = false;
    }
  }
}
