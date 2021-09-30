import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfood_delivery/controllers/location_controller.dart';
import 'package:myfood_delivery/repositories/address_repository.dart';
import 'package:myfood_delivery/repositories/menu_repository.dart';
import 'package:myfood_delivery/repositories/product_repository.dart';
import 'package:myfood_delivery/utils/page_transition.dart';

import 'controllers/home_controller.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

void main() {
  Get.put(MenuRepository());
  Get.put(HomeController());
  Get.put(ProductRepository());
  Get.put(AddressRepository());
  Get.put(LocationController());
  // WidgetsBinding.instance?.renderView.automaticSystemUiAdjustment = false;
  // final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  // binding.renderView.automaticSystemUiAdjustment = false;

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.grey[50],
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.grey[50],
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              toolbarTextStyle: TextStyle(
                color: Colors.black,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Product Sans',
              ),
            ),
            primarySwatch: Colors.red,
            fontFamily: 'Product Sans',
          ),
          initialRoute: Routes.initialRoute,
          getPages: getPages,
          customTransition: SharedZaxisPageTransitionVertical(),
        ),
      ),
    );
  }
}
