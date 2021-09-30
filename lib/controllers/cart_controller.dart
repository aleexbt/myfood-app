import 'package:get/get.dart';
import 'package:myfood_delivery/models/optional_model.dart';

class CartController extends GetxController {
  RxString _itemId = ''.obs;
  RxString _itemTitle = ''.obs;
  Rx<Optionals> _itemOptionals = Optionals(optionals: {}).obs;
  RxInt _itemPrice = 0.obs;
  RxList<String> _checkedItems = List<String>.empty(growable: true).obs;
  RxList<String> _selectedItems = List<String>.empty(growable: true).obs;

  String get itemId => _itemId.value;
  String get itemTitle => _itemTitle.value;
  Optionals get itemOptionals => _itemOptionals.value;
  int get itemPrice => _itemPrice.value;
  List<String> get checkItems => _checkedItems;
  List<String> get selectedItems => _selectedItems;

  void addOptional({required String key, required dynamic value}) {
    _itemOptionals.value.optionals?[key] =
        _itemOptionals.value.optionals?[key] != null
            ? _itemOptionals.value.optionals![key] + [value]
            : [value];
    _itemOptionals.refresh();
  }

  void removeOptional({required String key, required dynamic value}) {
    int index = _itemOptionals.value.optionals?[key].indexOf(value);
    _itemOptionals.value.optionals?[key].removeAt(index);
  }

  void switchOptional({required String key, required dynamic value}) {
    if (_itemOptionals.value.optionals![key] != null &&
        _itemOptionals.value.optionals![key].length > 0) {
      // removeOptional(key: key, value: value);
      _itemOptionals.value.optionals![key].clear();
      addOptional(key: key, value: value);
      isSelected(key: key, value: value);
    } else {
      addOptional(key: key, value: value);
      isSelected(key: key, value: value);
    }
  }

  int getOptionalSize({required String key}) {
    if (_itemOptionals.value.optionals![key] != null) {
      return _itemOptionals.value.optionals![key].length;
    } else {
      return 0;
    }
  }

  int isSelected({required String key, required dynamic value}) {
    if (_itemOptionals.value.optionals![key] != null &&
        _itemOptionals.value.optionals![key].contains(value)) {
      return 1;
    } else {
      return 0;
    }
  }

  void checkout() {
    print('checkout');
    print(_itemOptionals.toJson());
  }
}
