import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class DesignKaosPage extends StatelessWidget{
  static const String routeName = '/kaos/design';
  double hargaBahan = 50000;
  double hargaJasa = 20000;
  String bahanBahan = "Konsultasi Desain, Pembuatan Konsep, Revisi Desain";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBarComponent(),
        body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'design',
          title: "Design Kaos",titleButton: "Design")
    );
  }
}