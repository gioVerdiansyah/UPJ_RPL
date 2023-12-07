import 'package:flutter/material.dart';
import 'package:upj_rpl/routes/app_route.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';

class ServiceKomputerPage extends StatefulWidget{
  const ServiceKomputerPage({super.key});
  static const String routeName = 'service-komputer';

  @override
  State<ServiceKomputerPage> createState() => _ServicePrinterView();
}

class _ServicePrinterView extends State<ServiceKomputerPage>{
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
                      "Service Komputer",
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
                              'Service Hardware',
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
                                  'Layanan Hardware Profesional: Perbaikan, upgrade, dan pemeliharaan perangkat keras dengan cepat dan handal. Optimalkan kinerja sistem Anda bersama kami.',
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
                                    Navigator.pushNamed(context, AppRoute.serviceHardwareRoute);
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
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        child: Column(
                          children: [
                            const Text(
                              'Service Software',
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
                                  'Service Software Cepat: Instalasi, pembaruan, dan perbaikan perangkat lunak dengan efisien. Pastikan performa optimal sistem Anda bersama layanan kami.',
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
                                    Navigator.pushNamed(context, AppRoute.serviceSoftwareRoute);
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