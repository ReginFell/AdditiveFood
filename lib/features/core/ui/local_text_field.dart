import 'package:additive_food/core/app_theme_widget.dart';
import 'package:flutter/material.dart';

class LocalTextField extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final TextEditingController controller;

  const LocalTextField({
    this.fieldKey,
    @required this.hintText,
    this.controller,
  });

  @override
  _LocalTextFieldState createState() => new _LocalTextFieldState();
}

class _LocalTextFieldState extends State<LocalTextField> {
  @override
  Widget build(BuildContext context) {
    final hintColor = ThemeContainer.of(context).textHintColor;
    final underlineColor = ThemeContainer.of(context).textFieldUnderlineColor;
    final textFieldPadding = ThemeContainer.of(context).textFieldContentPadding;

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: textFieldPadding,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(decorationColor: underlineColor),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: underlineColor)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: underlineColor)),
      ),
    );
  }
}
