import 'package:dio/dio.dart';
import 'package:myfood_delivery/models/menu_model.dart';
import 'package:myfood_delivery/services/dio_client.dart';

DioClient _dio = DioClient();

class MenuRepository {
  Future<Menu> findAll() async {
    final Response response = await _dio.get('/menu');
    return Menu.fromJson(response.data);
  }
}
