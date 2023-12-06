import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoute{
  static final String API_KEY = dotenv.get("API_KEY");

  static final Uri loginRoute = Uri.parse("${dotenv.get("API_URL")}/login");
  static final Uri serviceKatridRoute = Uri.parse("${dotenv.get("API_URL")}/service-printer/katrid");
  static final Uri getRiwayatPembelianRoute = Uri.parse("${dotenv.get("API_URL")}/riwayat-pembelian");
}