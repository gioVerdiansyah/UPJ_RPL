import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class BeliKaosPage extends StatelessWidget{
  static const String routeName = '/kaos/beli';
  double hargaBahan = 60000;
  double hargaJasa = 10000;
  String bahanBahan = "Kaos Cotton Standar, Warna: Hitam, Ukuran: M";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBarComponent(),
        body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'kaos',
          title: "Beli Kaos",titleButton: "Beli",)
    );
  }
}