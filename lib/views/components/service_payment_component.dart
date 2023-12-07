import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/payment_model.dart';

class ServicePaymentComponent extends StatefulWidget {
  ServicePaymentComponent(
      {super.key,
      required this.hargaBahan,
      required this.hargaJasa,
      required this.bahanBahan,
      required this.type,
      required this.title,
      this.titleButton = 'service'});
  final double hargaBahan;
  final double hargaJasa;
  final String bahanBahan;
  final String type;
  final String title;
  final String titleButton;

  @override
  State<ServicePaymentComponent> createState() => _ServicePaymentView();
}

class _ServicePaymentView extends State<ServicePaymentComponent> {
  @override
  Widget build(BuildContext context) {
    double hargaBahan = widget.hargaBahan;
    double hargaJasa = widget.hargaJasa;
    String bahanBahan = widget.bahanBahan;
    String type = widget.type;
    String title = widget.type;
    String titleButton = widget.titleButton;
    double total = hargaBahan + hargaJasa;
    return Scaffold(
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
                        const Text('Pembayaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('${title}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Biaya Bahan", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              bahanBahan,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
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
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(total))
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Processing Data'),
                        backgroundColor: Colors.green.shade300,
                      ));
                      var response = await PaymentModel.sendPost(hargaBahan, hargaJasa, type);
                      if (response['service']['success']) {
                        if (context.mounted) {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: "Berhasil!",
                              text: "Berhasil meservice ${type}",
                            ),
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.danger,
                              title: "Gagal!",
                              text: response['service']['message'],
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
                      child: Text(
                        "$titleButton Sekarang",
                        style: const TextStyle(
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
