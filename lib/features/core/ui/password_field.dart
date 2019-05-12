import 'package:additive_food/core/app_theme_widget.dart';
import 'package:additive_food/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    const iconSize = 26.0;

    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Stack(
        children: <Widget>[
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(bottom: 4, top: 8, right: iconSize),
              hintText: localization.password,
              hintStyle: TextStyle(color: hintColor),
              labelStyle: TextStyle(decorationColor: underlineColor),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: underlineColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: underlineColor)),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: SvgPicture.asset(
                _obscureText
                    ? "assets/icons/eye.svg"
                    : "assets/icons/eye_open.svg",
                height: iconSize,
                color: hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
