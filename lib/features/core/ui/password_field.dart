import 'package:additive_food/core/app_theme_widget.dart';
import 'package:additive_food/localization/localization.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final hintColor = ThemeContainer.of(context).hintColor;
    final underlineColor = ThemeContainer.of(context).textFieldUnderlineColor;

    return TextField(
        key: widget.fieldKey,
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: localization.password,
            hintStyle: TextStyle(color: hintColor),
            labelStyle: TextStyle(decorationColor: underlineColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: underlineColor)),
            suffixIcon: Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    OutlineButton(
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        borderSide: BorderSide(
                            color: hintColor, width: _obscureText ? 1.0 : 15.0),
                        shape: CircleBorder())
                  ]),
            ))));
  }
}
