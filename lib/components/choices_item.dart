// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';
// import 'package:myfood_delivery/controllers/cart_controller.dart';
// import 'package:myfood_delivery/models/product_model.dart';

// extension ExtendedIterable<E> on Iterable<E> {
//   Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
//     var i = 0;
//     return map((e) => f(e, i++));
//   }

//   void forEachIndexed(void Function(E e, int i) f) {
//     var i = 0;
//     forEach((e) => f(e, i++));
//   }
// }

// class CheckboxWidget extends StatelessWidget {
//   final List<Choices> choices;
//   final CartController _cartController = Get.find();

//   CheckboxWidget({
//     Key? key,
//     required this.choices,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: choices
//             .mapIndexed(
//               (choice, i) => Column(
//                 children: [
//                   Text(
//                     choice.title?.toUpperCase() ?? '',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Column(
//                     children: choice.options!
//                         .map(
//                           (option) => Obx(
//                             () => CheckboxListTile(
//                               title: Text(option.title!),
//                               value: _cartController.checkItems
//                                   .contains(option.uuid),
//                               onChanged: choices[i].max! ==
//                                           _cartController.getOptionalSize(
//                                               key: choice.title!) &&
//                                       !_cartController.checkItems
//                                           .contains(option.uuid)
//                                   ? null
//                                   : (bool? value) {
//                                       if (_cartController.checkItems
//                                           .contains(option.uuid)) {
//                                         _cartController.checkItems
//                                             .remove(option.uuid);

//                                         _cartController.removeOptional(
//                                             key: choice.title!,
//                                             value: option.title);
//                                       } else {
//                                         if (choices[i].max! >
//                                             _cartController.getOptionalSize(
//                                                 key: choice.title!)) {
//                                           _cartController.checkItems
//                                               .add(option.uuid!);

//                                           _cartController.addOptional(
//                                               key: choice.title!,
//                                               value: option.title!);
//                                         }
//                                       }
//                                       timeDilation = value! ? 1.0 : 1.0;
//                                     },
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ],
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
