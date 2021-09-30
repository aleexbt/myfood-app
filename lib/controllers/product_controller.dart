import 'package:get/get.dart';
import 'package:myfood_delivery/models/optional_model.dart';
import 'package:myfood_delivery/models/product_model.dart';
import 'package:myfood_delivery/repositories/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository = Get.find();

  String? _productId = Get.parameters['id'];
  Rx<Product> _product = Product().obs;
  Rx<Optionals> _productOptionals = Optionals(optionals: {}).obs;
  RxList<String> _checkedItems = List<String>.empty(growable: true).obs;
  RxList<String> _selectedItems = List<String>.empty(growable: true).obs;

  RxBool _isLoading = true.obs;
  RxBool _hasError = false.obs;

  Product get product => _product.value;
  Optionals get productOptionals => _productOptionals.value;
  List<String> get checkItems => _checkedItems;
  List<String> get selectedItems => _selectedItems;

  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    super.onInit();
    findOne(id: _productId!);
  }

  void findOne({required String id}) async {
    try {
      _isLoading.value = true;
      Product product = await _productRepository.findOne(id: id);
      _product.value = product;
    } catch (err) {
      _hasError.value = true;
    } finally {
      _isLoading.value = false;
    }
  }

  void addOptional({required String key, required dynamic value}) {
    _productOptionals.value.optionals?[key] =
        _productOptionals.value.optionals?[key] != null
            ? _productOptionals.value.optionals![key] + [value]
            : [value];
    _productOptionals.refresh();
  }

  void removeOptional({required String key, required dynamic value}) {
    int index = _productOptionals.value.optionals?[key].indexOf(value);
    _productOptionals.value.optionals?[key].removeAt(index);
  }

  void switchOptional({required String key, required dynamic value}) {
    if (_productOptionals.value.optionals![key] != null &&
        _productOptionals.value.optionals![key].length > 0) {
      _productOptionals.value.optionals![key].clear();
      addOptional(key: key, value: value);
      isSelected(key: key, value: value);
    } else {
      addOptional(key: key, value: value);
      isSelected(key: key, value: value);
    }
  }

  int getOptionalSize({required String key}) {
    if (_productOptionals.value.optionals![key] != null) {
      return _productOptionals.value.optionals![key].length;
    } else {
      return 0;
    }
  }

  int isSelected({required String key, required dynamic value}) {
    if (_productOptionals.value.optionals![key] != null &&
        _productOptionals.value.optionals![key].contains(value)) {
      return 1;
    } else {
      return 0;
    }
  }
}
