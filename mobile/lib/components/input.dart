import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/themeColors.dart';

class StandardInput extends StatelessWidget {
  final Function onChanged;
  final bool isObscure;

  StandardInput({this.onChanged, this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.isObscure,
      onChanged: this.onChanged ?? (newValue) => {},
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 15,
        fontFamily: 'Spectral',
        color: CurrentTheme.themeColors['background']['light'],
      ),
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 3,
            color: CurrentTheme.themeColors['background']['light'],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 3,
            color: CurrentTheme.themeColors['background']['light'],
          ),
        ),
      ),
    );
  }
}
