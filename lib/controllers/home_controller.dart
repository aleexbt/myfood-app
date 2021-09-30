import 'package:get/get.dart';
import 'package:myfood_delivery/models/menu_model.dart';
import 'package:myfood_delivery/repositories/menu_repository.dart';

class HomeController extends GetxController {
  final MenuRepository _menuRepository = Get.find();

  RxList<MenuItems> _menu = List<MenuItems>.empty(growable: true).obs;
  RxBool _isLoading = false.obs;
  RxBool _hasError = false.obs;

  List<MenuItems> get menu => _menu;
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    super.onInit();
    getMenu();
  }

  void getMenu() async {
    try {
      _isLoading.value = true;
      Menu menu = await _menuRepository.findAll();
      List<MenuItems> items = menu.data!;
      _menu.value = items;
    } catch (err) {
      _hasError.value = true;
    } finally {
      _isLoading.value = false;
    }
  }
}
