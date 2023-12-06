import 'package:flutter/material.dart';
import 'package:upj_rpl/routes/app_route.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';

class ServicePrinterPage extends StatefulWidget{
  const ServicePrinterPage({super.key});
  static const String routeName = 'service-printer';

  @override
  State<ServicePrinterPage> createState() => _ServicePrinterView();
}

class _ServicePrinterView extends State<ServicePrinterPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppBarComponent(),
      drawer: const SideBar(),
      body: Container(
        child: Container(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                      "Service Printer",
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
                              'Ganti Katrid',
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
                                  'Ganti katrid printer dengan mudah dan cepat. Dapatkan layanan terpercaya untuk hasil cetak yang tajam dan berkualitas.',
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
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoute.gantiKatridRoute);
                                },
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Service Sekarang",
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
                                'Isi Tinta',
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
                                    'Isi tinta printer dengan cepat dan praktis. Layanan kami siap memastikan kelancaran hasil cetak Anda.',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Service Sekarang",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward, size: 15)
                                  ],
                                ),
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
                              'Ganti Roll',
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
                                  'Ganti roll printer tanpa repot. Layanan kami memastikan kelancaran cetak dengan pergantian roll yang cepat dan efisien.',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Service Sekarang",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, size: 15)
                                ],
                              ),
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
      ),
    );
  }
}