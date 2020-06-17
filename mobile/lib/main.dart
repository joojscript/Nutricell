import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutricell/pages/Dashboard.dart';
import './pages/Login.dart';
import './pages/Register.dart';
import './pages/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutricell',
      initialRoute: Home.routeId,
      routes: {
        Home.routeId: (context) => Home(),
        Login.routeId: (context) => Login(),
        Register.routeId: (context) => Register(),
        Dashboard.routeId: (context) => Dashboard(),
      },
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'PT'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
    );
  }
}
