import 'package:dio/dio.dart';
import 'package:myfood_delivery/models/product_model.dart';
import 'package:myfood_delivery/services/dio_client.dart';

DioClient _dio = DioClient();

class ProductRepository {
  Future<Product> findOne({required String id}) async {
    final Response response = await _dio.get('/product/$id');
    return Product.fromJson(response.data);
  }
}
