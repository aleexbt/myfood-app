import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:myfood_delivery/controllers/product_controller.dart';
import 'package:myfood_delivery/models/product_model.dart';

extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}

class SelectOptionalWidget extends StatelessWidget {
  final List<Choices> choices;
  final ProductController _productController = Get.find();

  SelectOptionalWidget({
    Key? key,
    required this.choices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: choices
          .mapIndexed(
            (choice, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                    child: Text(
                      choice.title ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: choice.options!
                      .map(
                        (option) => Obx(
                          () => choice.max == 1
                              ? radioSelect(choice, option)
                              : checkboxSelect(option, i, choice),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  RadioListTile<int> radioSelect(Choices choice, Options option) {
    return RadioListTile(
      value: _productController.isSelected(
          key: choice.title!, value: option.title),
      groupValue: 1,
      title: Text(option.title!),
      toggleable: true,
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (val) {
        _productController.switchOptional(
            key: choice.title!, value: option.title!);
      },
    );
  }

  CheckboxListTile checkboxSelect(Options option, int i, Choices choice) {
    return CheckboxListTile(
      title: Text(option.title!),
      value: _productController.checkItems.contains(option.id),
      onChanged: choices[i].max! ==
                  _productController.getOptionalSize(key: choice.title!) &&
              !_productController.checkItems.contains(option.id)
          ? null
          : (bool? value) {
              if (_productController.checkItems.contains(option.id)) {
                _productController.checkItems.remove(option.id);

                _productController.removeOptional(
                    key: choice.title!, value: option.title);
              } else {
                if (choices[i].max! >
                    _productController.getOptionalSize(key: choice.title!)) {
                  _productController.checkItems.add(option.id!);

                  _productController.addOptional(
                      key: choice.title!, value: option.title!);
                }
              }
              timeDilation = value! ? 1.0 : 1.0;
            },
    );
  }
}
