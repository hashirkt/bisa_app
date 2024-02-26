import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{

  AppTheme._();
  //**************************
  //colors
  //**************************



  static const Color backColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color smallText = Colors.grey;





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

  static  TextStyle navigationText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600);


  static  TextStyle profilePageTab = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600);


  static  TextStyle smallHead = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500);


  static  TextStyle smallHeadGreen = TextStyle(
      color: Colors.green,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static  TextStyle titleText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static  TextStyle fieldText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600);

  static  TextStyle buttonText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600);

  static  TextStyle tabText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static  TextStyle tabText2 = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static  TextStyle labelText = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static  TextStyle labelTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static  TextStyle menuButtonText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500);

  static  TextStyle pageHead = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static  TextStyle headText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600);
  static  TextStyle headTextWhite = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600);

}


//************************************************
//************************************************