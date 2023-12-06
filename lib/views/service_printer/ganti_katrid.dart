import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:upj_rpl/model/service_print_model.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/views/service_printer_page.dart';

class GantiKatridPage extends StatelessWidget {
  static const String routeName = 'service/ganti-katrid';

  double hargaBahan = 105000;
  double hargaJasa = 15000;
  String bahanBahan = "Wadah Plastik(1x), Spon(1x), Chip(1x)";

  GantiKatridPage({super.key});
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    double total = hargaBahan + hargaJasa;
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
                        const Text('Pembayaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text('Service ganti katrid', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Biaya Bahan", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(bahanBahan),
                        ],
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
                      var response = await ServicePrintModel.sendPost(hargaBahan, hargaJasa);
                      if (response['service']['success']) {
                        if (context.mounted) {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: "Berhasil!",
                              text: "Berhasil meservice katrid",
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
                      child: const Text(
                        "Service Sekarang",
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
