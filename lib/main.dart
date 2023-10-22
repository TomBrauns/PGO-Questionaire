import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//routes

import 'routes/HomeRoute.dart';
import 'routes/SurveyRoute.dart';
import 'routes/RegistrationRoute.dart';
import 'routes/ThankYouRoute.dart';

/* ---STYLE CONVENTIONS---
    header: 20
    gap between topics: 25
    text size: 18
*/

//main
void main() {
  runApp(MaterialApp(
    //-------- DISABLE DEBUG BANNER --------
    debugShowCheckedModeBanner: false,

    //-------- LOCALIZATIONS (Calender) --------
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('de'),
    ],
    locale: const Locale('de'),

    //-------- ROUTES --------
    initialRoute: '/',
    routes: {
      '/': (context) => new HomeRoute(),
      '/second': (context) => new SurveyRoute(),
      '/third': (context) => new RegistrationRoute(),
      '/fourth': (context) => new ThankYouRoute(),
    },
  ));
}
