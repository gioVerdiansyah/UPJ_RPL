import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:upj_rpl/views/service_printer/ganti_katrid.dart';
import 'package:upj_rpl/views/service_printer_page.dart';

import '../views/home_page.dart';
import '../views/login_page.dart';

class AppRoute{
  static GetStorage box = GetStorage();
  static String INITIAL = hasLogin();

  static String hasLogin() {
    var dataLogin = box.read('dataLogin');
    if (dataLogin != null) {
      return HomePage.routeName;
    } else {
      return LoginPage.routeName;
    }
  }

  // routeName
  static const String homeRoute = HomePage.routeName;
  static const String loginRoute = LoginPage.routeName;
  static const String servicePrinterRoute = ServicePrinterPage.routeName;
  static const String gantiKatridRoute = GantiKatridPage.routeName;

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomePage(),
    loginRoute: (context) => LoginPage(),
    servicePrinterRoute: (context) => const ServicePrinterPage(),
    gantiKatridRoute: (context) => GantiKatridPage()
  };
}