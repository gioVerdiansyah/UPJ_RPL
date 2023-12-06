import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_route.dart';
import '../login_page.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  static final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    final user = box.read('dataLogin')['user'] ?? "";
    final detailUser = box.read('dataLogin')['user']['detail_user'] ?? "";
    void NavigasiKe(routeName){
      if(ModalRoute.of(context)?.settings.name != routeName) {
        Navigator.pushNamed(context, routeName);
      }
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/RPL.png',
                      width: 75,
                      height: 75,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text('UPJ RPL', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                    )
                  ],
                ),
              ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              NavigasiKe(AppRoute.homeRoute);
            },
          ),ListTile(
            title: const Text("Service Printer"),
            onTap: () {
              NavigasiKe(AppRoute.servicePrinterRoute);
            },
          ),ListTile(
            title: const Text("Logout"),
            onTap: () async {
              ArtDialogResponse response = await ArtSweetAlert.show(
                  barrierDismissible: false,
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                      denyButtonText: "Batal",
                      title: "Apakah Anda yakin?",
                      confirmButtonText: "Ya, logout",
                      type: ArtSweetAlertType.warning
                  )
              );

              if(response==null) {
                return;
              }

              if(response.isTapConfirmButton) {
                GetStorage().erase();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                );
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
