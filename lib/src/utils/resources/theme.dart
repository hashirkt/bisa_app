import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theme{

  Theme._();
  //**************************
  //colors
  //**************************



  static const Color backColor = Colors.white;
  static const Color textColor = Colors.black;




//*************************************************
//*************************************************


  //***************************
  //fonts
  //***************************

  static final figTreeFont = GoogleFonts.figtree();

//*************************************************
//*************************************************


  //**************************
  //textStyle
  //**************************

  static  TextStyle headText = TextStyle(
      fontFamily: figTreeFont.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500);
}


//************************************************
//************************************************