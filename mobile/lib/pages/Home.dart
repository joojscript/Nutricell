import 'package:flutter/material.dart';
import 'package:nutricell/utilities/themeColors.dart';
import '../utilities/generic_page.dart';
import '../components/button.dart';
import 'package:nutricell/app_localizations.dart';

class Home extends StatelessWidget {
  static final String routeId = '/';

  @override
  Widget build(BuildContext context) {
    return GenericPage(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset('assets/interface-assets/logo.png'),
              ),
              Text(
                'NUTRICELL',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontFamily: 'Spectral',
                  color: CurrentTheme.themeColors['background']['light'],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StandardButton(
                    text: AppLocalizations.of(context).translate('home/login'),
                    onPressed: () => {Navigator.pushNamed(context, '/login')},
                  ),
                  SizedBox(width: 10),
                  StandardButton(
                    text: AppLocalizations.of(context).translate('home/signup'),
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/register')},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.copyright,
                    color: CurrentTheme.themeColors['background']['light'],
                  ),
                  Text(
                    AppLocalizations.of(context).translate('home/rights'),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 10,
                      fontFamily: 'Spectral',
                      color: CurrentTheme.themeColors['background']['light'],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
