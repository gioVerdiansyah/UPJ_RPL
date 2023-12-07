import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:upj_rpl/model/payment_model.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class ServiceKatridPage extends StatelessWidget {
  static const String routeName = 'service/katrid';

  double hargaBahan = 105000;
  double hargaJasa = 15000;
  String bahanBahan = "Wadah Plastik(1x), Spon(1x), Chip(1x)";

  ServiceKatridPage({super.key});
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    double total = hargaBahan + hargaJasa;
    return Scaffold(
      appBar: const AppBarComponent(),
      body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'katrid',
        title: "Service Katrid",)
    );
  }
}
