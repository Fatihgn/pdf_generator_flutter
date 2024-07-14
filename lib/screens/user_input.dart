import 'package:flutter/material.dart';
import 'package:teklif_siparis_project/models/company.dart';
import 'package:teklif_siparis_project/screens/customer.dart';
import 'package:teklif_siparis_project/services/ems_pdf_services.dart';

import 'package:teklif_siparis_project/widgets/screen_widgets.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final formKey = GlobalKey<FormState>();

  var tfIsim = TextEditingController();
  var tfAdres = TextEditingController();
  var tfFax = TextEditingController();
  var tfTelefon = TextEditingController();
  var tfVergiNo = TextEditingController();
  var tfVergiDairesi = TextEditingController();
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
                    "1.Adım",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(255, 232, 119, 23)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CommonWidgets.my_text("Lütfen Şirket Bilgilerinizi Giriniz",
                      FontWeight.normal, Colors.black54),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonWidgets.my_text(
                      "Şirket İsminiz", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form("Şirket İsminiz",
                      const Icon(Icons.person), tfIsim, TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidgets.my_text("Adres", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form("Adres", const Icon(Icons.home),
                      tfAdres, TextInputType.streetAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidgets.my_text("Faks", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form(
                      "Faks", const Icon(Icons.fax), tfFax, TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidgets.my_text(
                      "Telefon", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form("Telefon", const Icon(Icons.phone),
                      tfTelefon, TextInputType.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidgets.my_text(
                      "Vergi No", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form("Vergi No", const Icon(Icons.numbers),
                      tfVergiNo, TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidgets.my_text(
                      "Vergi Dairesi", FontWeight.bold, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidgets.my_form(
                      "Vergi Dairesi",
                      const Icon(Icons.home_work),
                      tfVergiDairesi,
                      TextInputType.name),
                  const SizedBox(
                    height: 40,
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
                        bool kontrolSonucu = formKey.currentState!.validate();
                        if (kontrolSonucu) {
                          Company company = Company(
                              name: tfIsim.text,
                              address: tfAdres.text,
                              fax: tfFax.text,
                              phone: tfTelefon.text,
                              taxNumber: tfVergiNo.text,
                              taxOffice: tfVergiDairesi.text);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerScreen(
                              company: company,
                            ),
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CommonWidgets.my_text(
                            "Kaydet", FontWeight.bold, Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
