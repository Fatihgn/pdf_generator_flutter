import 'package:flutter/material.dart';
import 'package:teklif_siparis_project/models/cari_model.dart';
import 'package:teklif_siparis_project/models/company.dart';
import 'package:teklif_siparis_project/models/product_model.dart';
import 'package:teklif_siparis_project/services/ems_pdf_services.dart';
import 'package:teklif_siparis_project/widgets/screen_widgets.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.company, required this.cari});

  Company company;
  Cari cari;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final EmsPdfService emsPdfService = EmsPdfService();
  final formKey = GlobalKey<FormState>();
  var tfIsim = TextEditingController();
  var tfAmount = TextEditingController();
  var tfPrice = TextEditingController();
  var tfKdv = TextEditingController();
  List<ProductModel> products = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Son Adım",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(255, 232, 119, 23)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CommonWidgets.my_text("Eklenecek ürünleri seçiniz",
                      FontWeight.normal, Colors.black54),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: products.isEmpty ? 460 : 460,
                    child: products.isEmpty
                        ? const Center(
                            child: Text(
                            "Hiç ürün eklenmedi.",
                            style: TextStyle(fontSize: 20),
                          ))
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(products[index].name),
                                  subtitle: Text(
                                      "${products[index].amount} tane x ${products[index].price} TL = ${products[index].total} TL"),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        products.removeAt(index);
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(244, 240, 127, 28),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      //shadowColor: Colors.red,

                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled:
                              true, // Form uzunsa kaydırma özelliğini etkinleştirir
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              child: SizedBox(
                                height: 475,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CommonWidgets.my_form(
                                        "Ürün Adı",
                                        const Icon(
                                            Icons.shopping_cart_outlined),
                                        tfIsim,
                                        TextInputType.name),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CommonWidgets.my_form(
                                        "Fiyat",
                                        const Icon(Icons.attach_money),
                                        tfPrice,
                                        TextInputType.number),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CommonWidgets.my_form(
                                        "Adet",
                                        const Icon(Icons.format_list_numbered),
                                        tfAmount,
                                        TextInputType.number),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CommonWidgets.my_form(
                                        "Kdv",
                                        const Icon(Icons.money_rounded),
                                        tfKdv,
                                        TextInputType.number),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              244, 240, 127, 28),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        //shadowColor: Colors.red,

                                        onPressed: () async {
                                          bool kontrolSonucu =
                                              formKey.currentState!.validate();
                                          if (kontrolSonucu) {
                                            setState(() {
                                              products.add(ProductModel(
                                                  name: tfIsim.text,
                                                  amount: double.parse(
                                                      tfAmount.text),
                                                  price: double.parse(
                                                      tfPrice.text),
                                                  total:
                                                      int.parse(tfAmount.text) *
                                                          double.parse(
                                                              tfPrice.text),
                                                  kdv: double.parse(
                                                      tfKdv.text)));
                                              tfIsim.clear();
                                              tfAmount.clear();
                                              tfPrice.clear();
                                              tfKdv.clear();
                                            });
                                            Navigator.of(context).pop();
                                          }
                                        },

                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: CommonWidgets.my_text("Ekle",
                                              FontWeight.bold, Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CommonWidgets.my_text(
                            "Ürün Ekle", FontWeight.bold, Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(244, 240, 127, 28),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      //shadowColor: Colors.red,

                      onPressed: () async {
                        if (products.isNotEmpty) {
                          final data = await emsPdfService.generateEMSPDF(
                              widget.cari, widget.company, products);
                          emsPdfService.savePdfFile("EMS PDF", data);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Ürün ekleyiniz."),
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CommonWidgets.my_text(
                            "PDF oluştur", FontWeight.bold, Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
