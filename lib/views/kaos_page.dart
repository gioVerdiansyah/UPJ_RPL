import 'package:flutter/material.dart';
import 'package:upj_rpl/routes/app_route.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';

class KaosPage extends StatefulWidget{
  const KaosPage({super.key});
  static const String routeName = '/kaos';

  @override
  State<KaosPage> createState() => _ServicePrinterView();
}

class _ServicePrinterView extends State<KaosPage>{
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
                      "Desgin Kaos",
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
                                  'Desain kaos kreatif dan unik, sesuai gaya Anda. Dapatkan kreasi pakaian yang membedakan dengan layanan desain kaos kami.',
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
                                  Navigator.pushNamed(context, AppRoute.designKaosRoute);
                                },
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Design Sekarang",
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
                                'Cetak Kaos',
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
                                    'Cetak kaos berkualitas tinggi dengan desain Anda sendiri. Layanan kami memberikan hasil cetak yang tajam dan awet untuk memenuhi kebutuhan pakaian Anda.',
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
                                    Navigator.pushNamed(context, AppRoute.cetakKaosRoute);
                                  },
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cetak Sekarang",
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
                              'Beli Kaos',
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
                                  'Beli kaos berkualitas tinggi dengan gaya unik. Temukan koleksi pakaian terbaik untuk melengkapi penampilan Anda.',
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
                                  Navigator.pushNamed(context, AppRoute.beliKaosRoute);
                                },
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Beli Sekarang",
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