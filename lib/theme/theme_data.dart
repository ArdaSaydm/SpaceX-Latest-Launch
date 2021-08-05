import 'package:flutter/material.dart';

ThemeData themeData() => ThemeData(
      primaryColor: Colors.blueGrey[800],
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black),
        subtitle1: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
