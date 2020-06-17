import 'package:flutter/material.dart';
import 'package:nutricell/components/button.dart';
import 'package:nutricell/utilities/generic_page.dart';
import 'package:nutricell/utilities/themeColors.dart';
import '../components/input.dart';
import 'package:http/http.dart' as http;
import '../globals.dart';
import 'dart:convert';
import 'package:nutricell/app_localizations.dart';

class Register extends StatefulWidget {
  static final String routeId = '/register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isDiabetic = false;
  bool isLactoseIntolerant = false;
  bool isHypertensive = false;
  String email = "";
  String password = "";
  String weight = "";
  String height = "";
  String age = "";
  String name = "";

  bool invalid = false;

  void onSubmit() async {
    if (this.email == "" &&
        this.password == "" &&
        this.weight == "" &&
        this.height == "" &&
        this.age == "" &&
        this.name == "") {
      setState(() {
        this.invalid = true;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registro Inválido'),
              content: Text(
                  'Todos os campos devem ser preenchidos para realizar o cadastro.'),
            );
          });
    }

    Map<String, dynamic> requestBody = {
      "email": this.email,
      "password": this.password,
      "name": this.name,
      "age": this.age,
      "height": this.height,
      "weight": this.weight,
      "isDiabetic": this.isDiabetic,
      "isLactoseIntolerant": this.isLactoseIntolerant,
      "isHypertensive": this.isHypertensive
    };

    String jsonBody = jsonEncode(requestBody);

    print(jsonBody);

    dynamic response = await http.post(
        isDev ? 'http://192.168.0.105:3333/users' : '',
        body: jsonBody,
        headers: {"Content-Type": 'application/json'});

    print(response.body);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registro Concluído'),
            content: Text('O registro foi realizado com sucesso.'),
          );
        });

    Future.delayed(
        Duration(seconds: 2), () => {Navigator.pushNamed(context, '/')});
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
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/interface-assets/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, left: 55),
                child: Text(
                  'NUTRICELL',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 40,
                    fontFamily: 'Spectral',
                    color: CurrentTheme.themeColors['background']['light'],
                  ),
                ),
              ),
              Container(
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/email'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            height: 50,
                            width: mediaQuery.size.width * 0.35,
                            child: StandardInput(
                              onChanged: (newValue) => {
                                setState(() => {this.email = newValue})
                              },
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/password'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: mediaQuery.size.width * 0.35,
                          child: StandardInput(
                            isObscure: true,
                            onChanged: (newValue) => {
                              setState(() => {this.password = newValue})
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/weight'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            height: 50,
                            width: mediaQuery.size.width * 0.2,
                            child: StandardInput(
                              onChanged: (newValue) => {
                                setState(() => {this.weight = newValue})
                              },
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/height'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: mediaQuery.size.width * 0.2,
                          child: StandardInput(
                            onChanged: (newValue) => {
                              setState(() => {this.height = newValue})
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/age'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            height: 50,
                            width: mediaQuery.size.width * 0.2,
                            child: StandardInput(
                              onChanged: (newValue) => {
                                setState(() => {this.age = newValue})
                              },
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('register/name'),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Spectral',
                            color: CurrentTheme.themeColors['background']
                                ['light'],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: mediaQuery.size.width * 0.2,
                          child: StandardInput(
                            onChanged: (newValue) => {
                              setState(() => {this.name = newValue})
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 250,
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context).translate('register/diabetic'),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Spectral',
                      color: CurrentTheme.themeColors['background']['light'],
                    ),
                  ),
                  value: this.isDiabetic,
                  onChanged: (newValue) => {
                    setState(() {
                      this.isDiabetic = newValue;
                    })
                  },
                  activeColor: CurrentTheme.themeColors['background']['light'],
                  checkColor: Colors.black,
                ),
              ),
              SizedBox(
                width: 250,
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .translate('register/hypertensive'),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Spectral',
                      color: CurrentTheme.themeColors['background']['light'],
                    ),
                  ),
                  value: this.isHypertensive,
                  onChanged: (newValue) => {
                    setState(() {
                      this.isHypertensive = newValue;
                    })
                  },
                  activeColor: CurrentTheme.themeColors['background']['light'],
                  checkColor: Colors.black,
                ),
              ),
              SizedBox(
                width: 250,
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .translate('register/lactoseIntolerant'),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Spectral',
                      color: CurrentTheme.themeColors['background']['light'],
                    ),
                  ),
                  value: this.isLactoseIntolerant,
                  onChanged: (newValue) => {
                    setState(() {
                      this.isLactoseIntolerant = newValue;
                    })
                  },
                  activeColor: CurrentTheme.themeColors['background']['light'],
                  checkColor: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: StandardButton(
                        text: 'CRIAR CONTA',
                        onPressed: () {
                          this.onSubmit();
                        },
                      ),
                    ),
                    StandardButton(
                      text: 'VOLTAR',
                      onPressed: () => {Navigator.pop(context)},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
