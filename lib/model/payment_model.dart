import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:upj_rpl/routes/api_route.dart';

class PaymentModel {
  static GetStorage box = GetStorage();
  static Future sendPost(double hargaBahan, double hargaJasa, String tipe, String tipePembayaran, int jumlahBarang,
      double jumlahBayar) async {
    print(hargaJasa);
    try {
      final Uri url = ApiRoute.paymentRoute;
      var response = await http.post(url,
          headers: {"Content-Type": "application/json", "x-api-key": ApiRoute.API_KEY},
          body: json.encode(
            {
              "user_id": box.read('dataLogin')['data']['id'],
              "harga_bahan": hargaBahan,
              "harga_jasa": hargaJasa,
              'jenis': tipe,
              'tipe_pembayaran': tipePembayaran,
              'jumlah_barang': jumlahBarang,
              'jumlah_bayar': jumlahBayar
            },
          ));
      var data = json.decode(response.body);
      return data;
    } catch (e) {
      print("Error: $e");
      return {
        'payment': {'success': false, 'message': "Ada kesalahan program!"}
      };
    }
  }

  static Future delete() async {
    try {
      final Uri url = ApiRoute.paymentDeleteRoute;
      var response = await http.delete(url,
          headers: {
            "Content-Type": 'application/json',
            "x-api-key": ApiRoute.API_KEY,
          },
          body: json.encode({"user_id": box.read('dataLogin')['data']['id']}));

      var data = json.decode(response.body);
      print(data);
      return data;
    } catch (e) {
      print("Error: $e");
      return {
        'payment': {'success': false, 'message': "Ada kesalahan program!"}
      };
    }
  }
}
