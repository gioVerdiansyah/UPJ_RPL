import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:upj_rpl/views/components/app_bar_component.dart';
import 'package:upj_rpl/views/payment_page.dart';
import 'package:upj_rpl/views/components/side_bar_component.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const String routeName = '/';
  final _formKey = GlobalKey<FormBuilderState>();

  late String opsiController;
  late String tipePembayaranController;
  final TextEditingController hargaBahanController = TextEditingController();
  final TextEditingController hargaJasaController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController jumlahBayar = TextEditingController();

  double totalHarga = 0.0;
  double totalKembalian = 0.0;

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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilder(
                key: widget._formKey,
                child: Column(
                  children: [
                    const Center(
                      child: Text("Menu Kasir", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    FormBuilderDropdown(
                      name: 'tipe',
                      initialValue: '-- Pilih Tipe --',
                      items: [
                        '-- Pilih Tipe --',
                        'ganti katrid',
                        'isi '
                            'tinta',
                        'ganti roll',
                        'service hardware',
                        'service software',
                        'design kaos',
                        'cetak kaos',
                        'kaos'
                      ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (value) {
                        setState(() {
                          widget.opsiController = value.toString();
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Opsi'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(), FormBuilderValidators.notEqual('-- Pilih Tipe --')]),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'hargaBahan',
                            decoration: const InputDecoration(
                              labelText: 'Harga Bahan',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.integer(),
                            ]),
                            controller: widget.hargaBahanController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'hargaJasa',
                            decoration: const InputDecoration(
                              labelText: 'Harga Jasa',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.integer(),
                            ]),
                            controller: widget.hargaJasaController,
                          ),
                        ),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'jumlahBarang',
                      decoration: const InputDecoration(
                        labelText: 'Jumlah Barang',
                      ),
                      controller: widget.jumlahBarangController,
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(), FormBuilderValidators.integer()]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              widget._formKey.currentState?.fields['hargaBahan']?.save();
                              widget._formKey.currentState?.fields['hargaJasa']?.save();
                              widget._formKey.currentState?.fields['jumlahBarang']?.save();

                              var hargaBahan = widget._formKey.currentState?.fields['hargaBahan']?.validate() ?? false;
                              var hargaJasa = widget._formKey.currentState?.fields['hargaJasa']?.validate() ?? false;
                              var jumlahBarang = widget._formKey.currentState?.fields['jumlahBarang']?.validate() ?? false;

                              // Memeriksa apakah ketiga field yang diinginkan valid
                              if (hargaBahan && hargaJasa && jumlahBarang) {
                                setState(() {
                                  widget.totalHarga = ((double.tryParse(widget.hargaBahanController.text) ?? 0.0) +
                                          (double.tryParse(widget.hargaJasaController.text) ?? 0.0)) *
                                      (int.tryParse(widget.jumlahBarangController.text) ?? 0);
                                });
                              }
                            },
                            child: const Text('Hitung'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Text("Total Harga: "),
                                Text(
                                  widget.totalHarga != ''
                                      ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(widget.totalHarga)
                                      : NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(0.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormBuilderChoiceChip(
                      name: 'tipe pembayaran',
                      decoration: const InputDecoration(labelText: "Tipe Pembayaran", border: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          widget.tipePembayaranController = value.toString();
                        });
                      },
                      selectedColor: Colors.green,
                      options: ['Cash', 'Debit', 'E-Wallet']
                          .map((e) => FormBuilderChipOption(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                    ),
                    FormBuilderTextField(
                      name: 'jumlahBayar',
                      decoration: const InputDecoration(
                        labelText: 'Jumlah bayar',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                        FormBuilderValidators.min(
                          ((double.tryParse(widget.hargaBahanController.text) ?? 0.0) +
                                  (double.tryParse(widget.hargaJasaController.text) ?? 0.0)) *
                              (int.tryParse(widget.jumlahBarangController.text) ?? 0),
                          errorText: 'Uang Kurang!!!',
                        ),
                      ]),
                      controller: widget.jumlahBayar,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              widget._formKey.currentState?.fields['jumlahBayar']?.save();
                              widget._formKey.currentState?.fields['hargaBahan']?.save();
                              widget._formKey.currentState?.fields['hargaJasa']?.save();
                              widget._formKey.currentState?.fields['jumlahBarang']?.save();

                              var jumlahBayar = widget._formKey.currentState?.fields['jumlahBayar']?.validate() ?? false;
                              var hargaBahan = widget._formKey.currentState?.fields['hargaBahan']?.validate() ?? false;
                              var hargaJasa = widget._formKey.currentState?.fields['hargaJasa']?.validate() ?? false;
                              var jumlahBarang = widget._formKey.currentState?.fields['jumlahBarang']?.validate() ?? false;

                              if (hargaBahan && hargaJasa && jumlahBarang && jumlahBayar) {
                                setState(() {
                                  widget.totalKembalian = ((double.tryParse(widget.jumlahBayar.text) ?? 0.0) - ((double
                                      .tryParse(widget.hargaBahanController.text) ?? 0.0) +
                                              (double.tryParse(widget.hargaJasaController.text) ?? 0.0)) *
                                          (int.tryParse(widget.jumlahBarangController.text) ?? 0));
                                  print(widget.totalKembalian);
                                });
                              }
                            },
                            child: const Text('Hitung Kembalian'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Text("Total Kembalian: "),
                                Text(
                                  widget.totalKembalian != ''
                                      ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(widget
                                      .totalKembalian)
                                      : NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.').format(0.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      child: InkWell(
                        onTap: () async {
                          if (widget._formKey.currentState?.saveAndValidate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServicePaymentPage(
                                  hargaBahan: double.tryParse(widget.hargaBahanController.text) ?? 0.0,
                                  hargaJasa: double.tryParse(widget.hargaJasaController.text) ?? 0.0,
                                  jumlahBarang: int.tryParse(widget.jumlahBarangController.text) ?? 0,
                                  type: widget.opsiController,
                                  typePembayaran: widget.tipePembayaranController,
                                  jumlahBayar: double.tryParse(widget.jumlahBayar.text) ?? 0.0,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 20,
                            child: Center(
                                child: Text(
                              "Cetak Struk",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
