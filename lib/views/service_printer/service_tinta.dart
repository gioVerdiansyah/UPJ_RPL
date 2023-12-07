import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class ServiceTintaPage extends StatelessWidget{
  static const String routeName = '/service/tinta';
  double hargaBahan = 50000;
  double hargaJasa = 10000;
  String bahanBahan = "Tinta Printer (1 botol), Cartridge Replacement (1x)";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarComponent(),
      body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'tinta',
          title: "Isi Tinta")
    );
  }
}