import 'package:flutter/material.dart';
import 'package:myfood_delivery/models/menu_model.dart';

import 'item_container.dart';

class MenuList extends StatelessWidget {
  final List<MenuItems> menu;
  const MenuList({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: menu.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  menu[index].title!,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: menu[index]
                    .items!
                    .map(
                      (item) => Column(
                        children: [
                          ItemContainer(
                            id: item.id,
                            title: item.title,
                            image: item.picture,
                            price: item.price,
                          ),
                          Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        });
  }
}
