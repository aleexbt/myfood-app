import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_loader.dart';
import 'package:intl/intl.dart';

class ItemContainer extends StatelessWidget {
  final String? id;
  final String? title;
  final String? image;
  final int? price;

  const ItemContainer(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return Stack(children: [
      Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Text(
                      currency.format(price!),
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ImageLoader(
                    width: 80,
                    height: 80,
                    src: image!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => Get.toNamed('/product/$id'),
          ),
        ),
      ),
    ]);
  }
}
