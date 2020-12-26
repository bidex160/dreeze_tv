
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData appThemeDark = ThemeData (

  primaryColor: Colors.blueGrey.shade700,
  accentColor: Color(0xff219653),
  primaryColorLight: Colors.blueGrey.shade800,
  primaryColorDark: Colors.blueGrey.shade900,
  backgroundColor:  Colors.blueGrey.shade700,
  splashColor: Colors.transparent,
  buttonTheme: ThemeData.light().buttonTheme.copyWith(
    buttonColor: Colors.blueGrey.shade700,
    textTheme: ButtonTextTheme.primary,
   shape: RoundedRectangleBorder(
   borderRadius: BorderRadius.circular(10)

   )

  ),
  textTheme: ThemeData.light().textTheme.copyWith(

    title: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color:Colors.white

    ),
    button: TextStyle(),
//subhead subject
    subhead: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:Colors.black
      //fontWeight: FontWeight.bold,

    ),
//display e.g labqeltext textfield
    display1: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black

    ),

    //display e.g textfield style
    display2: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:Colors.white
    ),
//button text
    display3: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: Colors.red

    ),
    display4: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 35,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: Colors.white

    ),
//subtitle paper
    subtitle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:Colors.black
    ),



  ),


  appBarTheme:AppBarTheme(
      // iconTheme: IconThemeData(
      //   color: Colors.white, //change your color here
      // ),
elevation: 0,
    color: Colors.transparent,
      textTheme:  ThemeData.light().textTheme.copyWith(
        title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.black
          //fontStyle: FontStyle.italic
        ),

      )

  ),


);

