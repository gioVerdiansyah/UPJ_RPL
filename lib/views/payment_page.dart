import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/routes/app_route.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';

import '../model/payment_model.dart';

class ServicePaymentPage extends StatefulWidget {
  ServicePaymentPage(
      {super.key,
      required this.hargaBahan,
      required this.hargaJasa,
      required this.jumlahBarang,
      required this.type,
      required this.typePembayaran, required this.jumlahBayar});
  final double hargaBahan;
  final int jumlahBarang;
  final double hargaJasa;
  final double jumlahBayar;
  final String type;
  final String typePembayaran;

  @override
  State<ServicePaymentPage> createState() => _ServicePaymentView();
}

class _ServicePaymentView extends State<ServicePaymentPage> {
  @override
  Widget build(BuildContext context) {
    double hargaBahan = widget.hargaBahan;
    int jumlahBarang = widget.jumlahBarang;
    double jumlahBayar = widget.jumlahBayar;
    double hargaJasa = widget.hargaJasa;
    String tipe = widget.type;
    String tipePembayaran = widget.typePembayaran;
    double total = (hargaBahan + hargaJasa) * jumlahBarang;
    double kembalian = jumlahBayar - total;
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Text('Struk Pembayaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(tipe, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 1.0,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Biaya Bahan", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(hargaBahan))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Biaya Jasa", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(hargaJasa))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jumlah Barang", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(jumlahBarang.toString())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(total))
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Jumlah Bayar:", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(jumlahBayar))
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Kembalian:", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(kembalian))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Tipe Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(tipePembayaran)
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Processing Data'),
                        backgroundColor: Colors.green.shade300,
                      ));
                      var response = await PaymentModel.sendPost(hargaBahan, hargaJasa, tipe, tipePembayaran,
                        jumlahBarang, jumlahBayar);
                      if (response['payment']['success']) {
                        if (context.mounted) {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: "Berhasil!",
                              text: response['payment']['message'],
                              onConfirm: () {
                                Navigator.pushNamed(context, AppRoute.homeRoute);
                              }
                            ),
                            barrierDismissible: false
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.danger,
                              title: "Gagal!",
                              text: response['payment']['message'],
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      alignment: Alignment.center, // Menengahkan teks
                      decoration: BoxDecoration(
                        color: Colors.blue, // Warna background
                        borderRadius: BorderRadius.circular(10), // Border radius
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          color: Colors.white, // Warna teks
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
