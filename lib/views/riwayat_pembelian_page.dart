import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/model/get_riwayat_pembelian_model.dart';

import 'components/app_bar_component.dart';

class RiwayatPembelianPage extends StatefulWidget {
  const RiwayatPembelianPage({super.key});
  static const String routeName = '/riwayat-pembelian';

  @override
  State<RiwayatPembelianPage> createState() => _RiwayatIzinView();
}

class _RiwayatIzinView extends State<RiwayatPembelianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: FutureBuilder(
        future: GetRiwayatPembelianModel.getData(),
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
                    'Riwayat Penggantian/Perbaikan',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data['riwayat']['data'].length,
                    itemBuilder: (context, index) {
                      var dataRiwayat = snapshot.data['riwayat']['data'][index];
                      var i = index + 1;
                      print(dataRiwayat);
                      return Container(
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#$i Penggantian/Perbaikan ${dataRiwayat['jenis']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  child: Container(
                                    height: 1.0,
                                    width: double.infinity,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Tanggal: ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse
                                    (dataRiwayat['created_at'].toString()))}",
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
