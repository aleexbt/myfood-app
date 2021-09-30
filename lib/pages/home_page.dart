import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myfood_delivery/components/address_select.dart';
import 'package:myfood_delivery/components/item_box.dart';
import 'package:myfood_delivery/components/menu_list.dart';
import 'package:myfood_delivery/controllers/home_controller.dart';
import 'package:myfood_delivery/controllers/location_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.grey[50],
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    final LocationController _locationController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                    child: Obx(
                  () => AddressSelect(
                    address: _locationController.displayAddress,
                    onTap: () => _locationController.locationInit(),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá Alex',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('O que você quer comer hoje?')
                        ],
                      ),
                      IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.search,
                            size: 35,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ItemBox(
                            image:
                                'https://static-images.ifood.com.br/image/upload/t_high/discoveries/TudoDeBomPertoDeVcHeaderApp_t2iQ.png',
                            onTap: () => {});
                      },
                    ),
                  ),
                ),
                GetX<HomeController>(
                    init: HomeController(),
                    builder: (_) {
                      if (_.isLoading) {
                        return CircularProgressIndicator();
                      }
                      return MenuList(menu: _.menu);
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.grey[800],
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.archivebox),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        // onTap: (int index) => _pageController.animateToPage(index,
        //     duration: Duration(milliseconds: 200), curve: Curves.linear),
        onTap: (int index) => {},
      ),
    );
  }
}
