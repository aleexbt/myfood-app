import 'dart:io';

import 'package:get/get.dart';
import 'package:myfood_delivery/pages/home_page.dart';
import 'package:myfood_delivery/pages/product_page.dart';
import 'routes.dart';
import 'package:myfood_delivery/splash.dart';

List<GetPage> getPages = [
  GetPage(
    name: Routes.initialRoute,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
  ),
  GetPage(
    name: Routes.product,
    page: () => ProductPage(),
    transition: Platform.isIOS ? Transition.native : null,
  ),
];
