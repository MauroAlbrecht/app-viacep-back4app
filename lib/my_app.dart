 import 'package:app_viacep_back4app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.aBeeZeeTextTheme()),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
