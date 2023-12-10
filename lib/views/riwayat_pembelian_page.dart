import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/model/get_riwayat_pembelian_model.dart';
import 'package:upj_rpl/model/payment_model.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/app_bar_component.dart';

class RiwayatPembelianPage extends StatefulWidget {
  RiwayatPembelianPage({super.key});
  static const String routeName = '/riwayat-pembelian';
  final box = GetStorage();

  @override
  State<RiwayatPembelianPage> createState() => _RiwayatIzinView();
}

class _RiwayatIzinView extends State<RiwayatPembelianPage> {
  late Future<dynamic> dataTransaksi;
  void refreshData() {
    setState(() {
      dataTransaksi = GetRiwayatPembelianModel.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshData();
    return Scaffold(
      appBar: const AppBarComponent(),
      drawer: const SideBar(),
      body: FutureBuilder(
        future: dataTransaksi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Riwayat Pembayaran',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color.fromRGBO(252, 198, 43, 1),
                        child: InkWell(
                          onTap: () {
                            Uri absenTroubleUrl = Uri.parse(
                                '${dotenv.get('APP_URL')}/get-transaction-data?user_id=${widget.box.read('dataLogin')['data']['id']}&rm_token=${widget.box.read('dataLogin')['data']['remember_token']}');
                            launchUrl(absenTroubleUrl);
                          },
                          child: const SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Cetak riwayat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(Icons.local_print_shop_outlined, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        color: const Color.fromRGBO(221, 44, 89, 1),
                        child: InkWell(
                          onTap: () async {
                            var response = await PaymentModel.delete();
                            if (response['payment']['success']) {
                              if (context.mounted) {
                                ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.success,
                                        title: "Berhasil!",
                                        text: response['payment']['message'],
                                        onConfirm: () {
                                          refreshData();
                                          Navigator.of(context).pop();
                                        }),
                                    barrierDismissible: false);
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
                          child: const SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hapus riwayat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(Icons.remove_circle_outline_rounded, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data['riwayat']['data'].length,
                    itemBuilder: (context, index) {
                      var dataRiwayat = snapshot.data['riwayat']['data'][index];
                      var i = index + 1;
                      return Container(
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#$i Pembayaran: ${dataRiwayat['jenis']}",
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child: Container(
                                    height: 1.0,
                                    width: double.infinity,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Tanggal: ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(dataRiwayat['created_at'].toString()))}",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: SizedBox(
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Harga Bahan: "),
                                              Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.')
                                                  .format(dataRiwayat['harga_bahan']))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Harga Jasa: "),
                                              Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.')
                                                  .format(dataRiwayat['harga_jasa']))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Jumlah Barang: "),
                                              Text("x${dataRiwayat['jumlah_barang']}")
                                            ],
                                          ),
                                          Container(
                                            height: 1.0,
                                            width: double.infinity,
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Total: "),
                                              Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.')
                                                  .format(dataRiwayat['total']))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Jumlah Bayar: "),
                                              Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.')
                                                  .format(dataRiwayat['jumlah_bayar']))
                                            ],
                                          ),
                                          Container(
                                            height: 1.0,
                                            width: double.infinity,
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Kembalian: "),
                                              Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.')
                                                  .format(dataRiwayat['kembalian']))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [const Text("Tipe Pembayaran: "), Text(dataRiwayat['tipe_pembayaran'])],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
