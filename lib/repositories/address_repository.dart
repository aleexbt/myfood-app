import 'package:dio/dio.dart';
import 'package:myfood_delivery/services/dio_client.dart';

DioClient _dio = DioClient();

class AddressRepository {
  Future getAddress({required double lat, required double long}) async {
    final Response response =
        await _dio.get('/services/geo?lat=$lat&lon=$long');
    return response.data;
  }
}
