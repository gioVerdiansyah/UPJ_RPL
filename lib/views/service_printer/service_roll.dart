import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class ServiceRollPage extends StatelessWidget{
  static const String routeName = '/service/roll';
  double hargaBahan = 120000;
  double hargaJasa = 20000;
  String bahanBahan = "Roll Kertas Printer(1x), Pelumas Printer(1x), Roda Roll(1x)";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarComponent(),
      body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'roll',
        title: "Ganti Roll",)
    );
  }
}