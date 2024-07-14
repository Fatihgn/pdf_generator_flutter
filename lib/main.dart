import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teklif_siparis_project/screens/home.dart';

void main() {
  runApp(const App());
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    //seedColor: const Color.fromARGB(255, 232, 119, 23),
    seedColor: const Color.fromARGB(255, 0, 55, 109),
  ),
  textTheme: GoogleFonts.oswaldTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
