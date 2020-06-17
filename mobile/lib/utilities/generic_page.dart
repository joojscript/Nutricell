import 'package:flutter/material.dart';
import 'package:nutricell/utilities/themeColors.dart';

class GenericPage extends StatelessWidget {
  final Widget child;
  final bool showLines;
  final bool showStripes;

  GenericPage({this.child, this.showLines = true, this.showStripes = true});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        color: CurrentTheme.themeColors['background']['light'],
        child: Center(
          child: Container(
            height: mediaQuery.size.height * 0.96,
            width: mediaQuery.size.width * 0.95,
            decoration: BoxDecoration(
              color: CurrentTheme.themeColors['background']['dark'],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: <Widget>[
                this.showStripes
                    ? Positioned(
                        top: -10,
                        left: -10,
                        child: SizedBox(
                          height: 150,
                          child: Image.asset(
                              'assets/interface-assets/stripes01.png'),
                        ),
                      )
                    : SizedBox(),
                this.showStripes
                    ? Positioned(
                        bottom: -10,
                        right: -10,
                        child: SizedBox(
                          height: 150,
                          child: Image.asset(
                              'assets/interface-assets/stripes02.png'),
                        ),
                      )
                    : SizedBox(),
                this.showLines
                    ? Positioned(
                        top: 20,
                        right: -10,
                        child: SizedBox(
                          height: 150,
                          child:
                              Image.asset('assets/interface-assets/line01.png'),
                        ),
                      )
                    : SizedBox(),
                this.showLines
                    ? Positioned(
                        bottom: 20,
                        left: -10,
                        child: SizedBox(
                          height: 150,
                          child:
                              Image.asset('assets/interface-assets/line02.png'),
                        ),
                      )
                    : SizedBox(),
                this.child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
