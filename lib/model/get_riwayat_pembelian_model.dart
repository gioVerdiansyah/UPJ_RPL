import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:upj_rpl/routes/api_route.dart';

class GetRiwayatPembelianModel{
  static Future getData()async{
    final box = GetStorage();
    try{
      var response = await http.get(
          Uri.parse("${ApiRoute.getRiwayatPembelianRoute}?user_id=${box.read('dataLogin')['data']['id']}"),
          headers: {
            "Content-Type": "application/json",
            "x-api-key": ApiRoute.API_KEY
          }
      );

      var data = json.decode(response.body);
      return data;
    }catch(e){
      print("Error: $e");
      return {'riwayat': {'success': false, 'message': "Ada kesalahan program"}};
    }
  }
}