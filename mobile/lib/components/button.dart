import 'package:flutter/material.dart';
import '../utilities/themeColors.dart';

class StandardButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Function onPressed;

  StandardButton(
      {this.text, this.height, this.width, this.fontSize = 20, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed ?? () => {},
      child: Container(
        constraints: BoxConstraints(
          minWidth: 100,
          minHeight: 40,
        ),
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: CurrentTheme.themeColors['background']['light'],
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                color: CurrentTheme.themeColors['background']['light'],
                decoration: TextDecoration.none,
                fontSize: this.fontSize,
                fontFamily: 'Spectral',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
