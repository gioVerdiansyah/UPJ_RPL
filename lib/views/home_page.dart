import 'package:flutter/material.dart';
import 'package:upj_rpl/routes/app_route.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';
import 'package:upj_rpl/views/service_printer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomeView();
}

class _HomeView extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      drawer: const SideBar(),
      body: Container(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                  child: Text(
                "Layanan Kami",
                style: TextStyle(fontSize: 30),
              )),
            ),
            SizedBox(
              width: 400,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Column(
                        children: [
                          const Text(
                            'Service Printer',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            height: 2.0,
                            width: 150.0,
                            color: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(
                                'Percayakan perawatan printer Anda pada layanan kami. Cetak dengan hasil terbaik, '
                                'cepat, dan memuaskan',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.left),
                          ),
                          Container(
                            height: 1.0,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, ServicePrinterPage.routeName);
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "READ MORE",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, size: 15)
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        child: Column(
                          children: [
                            const Text(
                              'Service Komputer',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Container(
                              height: 2.0,
                              width: 150.0,
                              color: Colors.black,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Text(
                                  'Service komputer cepat, handal, dan profesional. Kembalikan performa optimal komputermu bersama kami.',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, AppRoute.serviceKomputerRoute);
                                },
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "READ MORE",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward, size: 15)
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Column(
                        children: [
                          const Text(
                            'Design Kaos',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            height: 2.0,
                            width: 150.0,
                            color: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(
                                'Desain kaos kreatif, unik, dan eksklusif. Ekspresikan gaya Anda dengan layanan desain kaos kami.',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.left),
                          ),
                          Container(
                            height: 1.0,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, AppRoute.kaosRoute);
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "READ MORE",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, size: 15)
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
