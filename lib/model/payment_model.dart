import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:upj_rpl/routes/api_route.dart';

class PaymentModel {
  static Future sendPost(double hargaBahan, double hargaJasa, String type) async {
    try {
      final Uri url = ApiRoute.paymentRoute;
      final GetStorage box = GetStorage();
      var response = await http.post(url,
          headers: {"Content-Type": "application/json", "x-api-key": ApiRoute.API_KEY},
          body: json.encode({"user_id": box.read('dataLogin')['data']['id'], "harga_bahan": hargaBahan, "harga_jasa":
          hargaJasa, 'type': type}));
      var data = json.decode(response.body);
      print(data);
      return data;
    } catch (e) {
      print("Error: $e");
      return {
        'service': {'success': false, 'message': "Ada kesalagan program"}
      };
    }
  }
}
