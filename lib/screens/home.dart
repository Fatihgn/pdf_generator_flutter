import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teklif_siparis_project/screens/user_input.dart';
import 'package:teklif_siparis_project/services/ems_pdf_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Teklif',
                        style: GoogleFonts.kanit(
                            textStyle: const TextStyle(
                                fontSize: 60,
                                color: Color.fromARGB(255, 232, 119, 23)))),
                    const TextSpan(text: "   "),
                    TextSpan(
                        text: 'Sipariş',
                        style: GoogleFonts.kanit(
                            textStyle: const TextStyle(
                                fontSize: 60,
                                color: Color.fromARGB(255, 0, 55, 109)))),
                  ],
                ),
              ),
              const Image(
                image: AssetImage('lib/assets/images/handshake.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(76, 127, 176, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //elevation: 10,
                      /*side: const BorderSide(
                            strokeAlign: 1, width: 1.5, color: Colors.black)*/
                    ),
                    //shadowColor: Colors.red,
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserInput(),
                      ));
                    },
                    child: Text("Hadi başlayalım",
                        style: GoogleFonts.kanit(
                            textStyle: const TextStyle(
                                fontSize: 25, color: Colors.white))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
