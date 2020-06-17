import 'package:flutter/material.dart';
import 'package:nutricell/components/button.dart';
import 'package:nutricell/utilities/generic_page.dart';
import 'package:nutricell/utilities/themeColors.dart';
import '../components/input.dart';
import 'package:http/http.dart' as http;
import 'package:nutricell/globals.dart';
import 'dart:convert';
import '../utilities/storage.dart';
import 'package:nutricell/app_localizations.dart';

class Login extends StatelessWidget {
  static final String routeId = '/login';

  String email = '';
  String password = '';

  handleLogin(BuildContext context) async {
    String jsonBody =
        jsonEncode({"email": this.email, "password": this.password});

    dynamic response = await http.post(
        isDev ? 'http://192.168.0.105:3333/sessions' : '',
        body: jsonBody,
        headers: {"Content-Type": 'application/json'});

    var parsedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      await storage.write(key: 'jwt', value: parsedJson['token']);
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return GenericPage(
      showLines: false,
      showStripes: false,
      child: Container(
        width: mediaQuery.size.width,
        child: Material(
          color: Colors.transparent,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  height: 80,
                  child: Image.asset('assets/interface-assets/logo.png'),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'NUTRICELL',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35,
                      fontFamily: 'Spectral',
                      color: CurrentTheme.themeColors['background']['light'],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  AppLocalizations.of(context).translate('login/email'),
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontFamily: 'Spectral',
                    color: CurrentTheme.themeColors['background']['light'],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),
                child: SizedBox(
                  width: mediaQuery.size.width * 0.6,
                  child: StandardInput(
                    onChanged: (newValue) {
                      this.email = newValue;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  AppLocalizations.of(context).translate('login/password'),
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontFamily: 'Spectral',
                    color: CurrentTheme.themeColors['background']['light'],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: SizedBox(
                  width: mediaQuery.size.width * 0.6,
                  child: StandardInput(
                    isObscure: true,
                    onChanged: (newValue) {
                      this.password = newValue;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: StandardButton(
                      text:
                          AppLocalizations.of(context).translate('login/login'),
                      onPressed: () => {handleLogin(context)},
                    ),
                  ),
                  StandardButton(
                    text:
                        AppLocalizations.of(context).translate('login/goback'),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
