import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:upj_rpl/views/riwayat_pembelian_page.dart';
import 'package:upj_rpl/views/service_komputer/service_hardware.dart';
import 'package:upj_rpl/views/service_printer/service_katrid.dart';
import 'package:upj_rpl/views/service_printer_page.dart';

import '../views/home_page.dart';
import '../views/kaos/beli_kaos.dart';
import '../views/kaos/cetak_kaos.dart';
import '../views/kaos/design_kaos.dart';
import '../views/kaos_page.dart';
import '../views/login_page.dart';
import '../views/service_komputer/service_software.dart';
import '../views/service_komputer_page.dart';
import '../views/service_printer/service_roll.dart';
import '../views/service_printer/service_tinta.dart';

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
  static const String serviceKomputerRoute = ServiceKomputerPage.routeName;
  static const String kaosRoute = KaosPage.routeName;

  static const String serviceKatridRoute = ServiceKatridPage.routeName;
  static const String serviceTintaRoute = ServiceTintaPage.routeName;
  static const String serviceRollRoute = ServiceRollPage.routeName;

  static const String serviceSoftwareRoute = ServiceSoftwarePage.routeName;
  static const String serviceHardwareRoute = ServiceHardwarePage.routeName;

  static const String designKaosRoute = DesignKaosPage.routeName;
  static const String cetakKaosRoute = CetakKaosPage.routeName;
  static const String beliKaosRoute = BeliKaosPage.routeName;

  static const String riwayatPembelianRoute = RiwayatPembelianPage.routeName;

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomePage(),
    loginRoute: (context) => LoginPage(),
    servicePrinterRoute: (context) => const ServicePrinterPage(),
    serviceKomputerRoute: (context) => const ServiceKomputerPage(),
    kaosRoute: (context) => const KaosPage(),
    serviceKatridRoute: (context) => ServiceKatridPage(),
    serviceTintaRoute: (context) => ServiceTintaPage(),
    serviceRollRoute: (context) => ServiceRollPage(),
    serviceSoftwareRoute: (context) => ServiceSoftwarePage(),
    serviceHardwareRoute: (context) => ServiceHardwarePage(),
    designKaosRoute: (context) => DesignKaosPage(),
    cetakKaosRoute: (context) => CetakKaosPage(),
    beliKaosRoute: (context) => BeliKaosPage(),
    riwayatPembelianRoute: (context) => RiwayatPembelianPage(),
  };
}