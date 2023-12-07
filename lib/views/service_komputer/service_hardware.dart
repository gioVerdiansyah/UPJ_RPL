import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class ServiceHardwarePage extends StatelessWidget{
  static const String routeName = '/service/hardware';
  double hargaBahan = 80000;
  double hargaJasa = 25000;
  String bahanBahan = "RAM Replacement(1x), Hard Drive Upgrade(1x), Thermal Paste(1x)";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBarComponent(),
        body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'hardware',
          title: "Service Hardware",)
    );
  }
}