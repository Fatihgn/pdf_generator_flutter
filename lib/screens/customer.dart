import 'package:flutter/material.dart';
import 'package:teklif_siparis_project/models/cari_model.dart';
import 'package:teklif_siparis_project/models/company.dart';
import 'package:teklif_siparis_project/screens/product.dart';

import '../widgets/screen_widgets.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({super.key, required this.company});
  Company company;

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  List<Cari> ChangeListe(String value) {
    return cariList.where((element) => element.name.contains(value)).toList();
  }

  List<Cari> cariList = [
    Cari(name: "MUTLU MARKET", incharge: "Veli Mutlu"),
    Cari(name: "SANCAK İLETİŞİM", incharge: "Ali SANCAK"),
    Cari(name: "AKIN ZAHİRE", incharge: "Zeynep AKIN"),
    Cari(name: "KASIM MARKET", incharge: "Ahmet KASIM"),
    Cari(name: "KİRAZ ZAHİRE", incharge: "Mustafa Kiraz"),
    Cari(name: "KAVAL İLETİŞİM", incharge: "Aydın KAVAK"),
    Cari(name: "BORAN TEKNOLOJİ", incharge: "Sibel BORAN"),
    Cari(name: "KURU TEKNOLOJİ", incharge: "Mustafa KURU"),
    Cari(name: "SON İLETİŞİM", incharge: "Aydın SON"),
    Cari(name: "YILMAZ MARKET", incharge: "Sibel Yılmaz"),
  ];
  List<Cari> sonList = [
    Cari(name: "MUTLU MARKET", incharge: "Veli Mutlu"),
    Cari(name: "SANCAK İLETİŞİM", incharge: "Ali SANCAK"),
    Cari(name: "AKIN ZAHİRE", incharge: "Zeynep AKIN"),
    Cari(name: "KASIM MARKET", incharge: "Ahmet KASIM"),
    Cari(name: "KİRAZ ZAHİRE", incharge: "Mustafa Kiraz"),
    Cari(name: "KAVAL İLETİŞİM", incharge: "Aydın KAVAK"),
    Cari(name: "BORAN TEKNOLOJİ", incharge: "Sibel BORAN"),
    Cari(name: "KURU TEKNOLOJİ", incharge: "Mustafa KURU"),
    Cari(name: "SON İLETİŞİM", incharge: "Aydın SON"),
    Cari(name: "YILMAZ MARKET", incharge: "Sibel Yılmaz"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "2.Adım",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 232, 119, 23)),
            ),
            const SizedBox(
              height: 3,
            ),
            CommonWidgets.my_text(
                "Cari Seçiniz", FontWeight.normal, Colors.black54),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(113, 221, 220, 220),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    sonList = ChangeListe(value);
                  });
                },
                style: const TextStyle(fontSize: 21),
                decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 21,
                    ),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(16),
                    hintText: "Aramak İstediğiniz Cariyi Giriniz",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 55, 109),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(20.0), // Sol üst köşeyi yuvarlatın
                        bottomLeft:
                            Radius.circular(20.0), // Sol alt köşeyi yuvarlatın
                      ),
                    ),
                    child: Center(
                      child: CommonWidgets.my_text(
                          "Cari Adı", FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 55, 109),
                      borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(20.0), // Sol üst köşeyi yuvarlatın
                        bottomRight:
                            Radius.circular(20.0), // Sol alt köşeyi yuvarlatın
                      ),
                    ),
                    child: Center(
                      child: CommonWidgets.my_text(
                          "Yetkili", FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: sonList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        Cari cari = sonList[index];
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            company: widget.company,
                            cari: cari,
                          ),
                        ));
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(113, 221, 220, 220),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Center(
                                  child: CommonWidgets.my_text(
                                      sonList[index].name,
                                      FontWeight.normal,
                                      Colors.black),
                                ))),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      child: Center(
                                    child: CommonWidgets.my_text(
                                        sonList[index].incharge,
                                        FontWeight.normal,
                                        Colors.black),
                                  )),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
