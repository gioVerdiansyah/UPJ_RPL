import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:restart_app/restart_app.dart';
import 'package:upj_rpl/routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');
  await GetStorage.init();
  final box = GetStorage();

  var connectivityResult = await Connectivity().checkConnectivity();
  bool isConnected = connectivityResult != ConnectivityResult.none;
  late bool isEnableLocation = false;


  if(!isConnected){
    runApp(const NoInternetModal());
  }else{
    runApp(const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.INITIAL,
      routes: AppRoute.routes,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class NoInternetModal extends StatelessWidget {
  const NoInternetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AlertDialog(
            title: const Text("Tidak Terkoneksi dengan Internet"),
            content: const Text("Anda tidak terkoneksi dengan internet!!\nRestart aplikasi jika sudah terhubung."),
            actions: [
              TextButton(
                onPressed: () async {
                  Restart.restartApp();
                },
                child: const Text("Restart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}