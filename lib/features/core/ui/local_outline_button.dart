import 'package:additive_food/core/app_theme_widget.dart';
import 'package:flutter/material.dart';

class LocalOutlineButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  LocalOutlineButton({this.child, @required this.onPressed});

  @override
  _LocalOutlineButtonState createState() => _LocalOutlineButtonState();
}

class _LocalOutlineButtonState extends State<LocalOutlineButton> {
  @override
  Widget build(BuildContext context) {
    final underlineColor = ThemeContainer.of(context).textFieldUnderlineColor;

    return OutlineButton(
        child: widget.child,
        borderSide: BorderSide(
          color: underlineColor, //Color of the border
          style: BorderStyle.solid, //Style of the border
          width: 1.8, //width of the border
        ),
        onPressed: widget.onPressed);
  }
}
