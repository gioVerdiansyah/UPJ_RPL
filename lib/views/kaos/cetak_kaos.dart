import 'package:flutter/material.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/service_payment_component.dart';

class CetakKaosPage extends StatelessWidget{
  static const String routeName = '/kaos/cetak';
  double hargaBahan = 30000;
  double hargaJasa = 15000;
  String bahanBahan = "Bahan Kaos Berkualitas, Tinta Cetak Spesial, Proses Cetak Warna Full";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBarComponent(),
        body: ServicePaymentComponent(bahanBahan: bahanBahan,hargaBahan: hargaBahan,hargaJasa: hargaJasa,type: 'cetak',
          title: "Cetak Kaos",titleButton: "Cetak",)
    );
  }
}