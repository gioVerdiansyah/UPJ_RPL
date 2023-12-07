import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class ServiceSoftwarePage extends StatelessWidget{
  static const String routeName = '/service/software';
  double hargaBahan = 60000;
  double hargaJasa = 15000;
  String bahanBahan = "Operating System Installation, Software Updates, Antivirus Installation";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBarComponent(),
        body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'software',
          title: "Service Software",)
    );
  }
}