import 'package:flutter/material.dart';
import 'package:nutricell/utilities/storage.dart';
import 'package:nutricell/utilities/themeColors.dart';
import '../utilities/generic_page.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:nutricell/globals.dart';
import 'dart:convert';
import 'package:nutricell/app_localizations.dart';

class Dashboard extends StatefulWidget {
  static final String routeId = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var decoded;
  var veredicts;
  var user;
  String food = '';
  String name = '';

  getResponse() async {
    dynamic user = await storage.read(key: 'jwt');

    dynamic response =
        await http.get(isDev ? 'http://192.168.0.105:3333/home' : '', headers: {
      "Content-Type": "application/json",
      "authorization": 'Bearer ${user}',
    });

    this.decoded = json.decode(response.body);

    print(this.decoded);

    this.veredicts = this.decoded['veredicts'];
    this.user = this.decoded['user'];
  }

  selectFood() {
    var random = new Random();
    int length = this.veredicts.length;
    int index = length <= 0 ? 0 : random.nextInt(length);
    var veredicts = this.decoded['veredicts'];
    if (length <= 0) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(
                'Não foi possível encontrar o seu alimento ideal no momento. Por favor retorne mais tarde.'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Ok'),
              )
            ],
          );
        },
      );
    }

    setState(() {
      this.food = veredicts[index]['name'];
      this.name = this.user['name'];
    });
    print('index >>> $index');
    print('length >>> $length');
  }

  caller() async {
    await getResponse();
    await selectFood();
  }

  @override
  void initState() {
    super.initState();
    caller();
    print(this.food);
  }

  @override
  Widget build(BuildContext context) {
    return GenericPage(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Image.asset('assets/interface-assets/logo.png'),
              ),
              Text(
                'NUTRICELL',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'Spectral',
                  color: CurrentTheme.themeColors['background']['light'],
                ),
              ),
              Text(
                '${AppLocalizations.of(context).translate('dashboard/welcome')} ${this.name}!',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontFamily: 'Spectral',
                  color: CurrentTheme.themeColors['background']['light'],
                ),
              ),
              Text(
                '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'Spectral',
                  color: CurrentTheme.themeColors['background']['light'],
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('dashboard/other'),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Spectral',
                  color: CurrentTheme.themeColors['background']['light'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  this.food != '' ? this.food : '',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    fontFamily: 'Spectral',
                    color: CurrentTheme.themeColors['background']['light'],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  this.selectFood();
                },
                child: Icon(
                  Icons.settings_backup_restore,
                  color: CurrentTheme.themeColors['background']['light'],
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
