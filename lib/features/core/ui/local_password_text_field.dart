import 'package:additive_food/core/app_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String eyeIconPath = "assets/icons/eye.svg";
const String openEyeIconPath = "assets/icons/eye_open.svg";

class LocalPasswordTextField extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;

  const LocalPasswordTextField({
    this.fieldKey,
    @required this.hintText,
    this.labelText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  });

  @override
  _LocalPasswordTextFieldState createState() =>
      new _LocalPasswordTextFieldState();
}

class _LocalPasswordTextFieldState extends State<LocalPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final hintColor = ThemeContainer.of(context).textHintColor;
    final underlineColor = ThemeContainer.of(context).textFieldUnderlineColor;
    final textFieldPadding = ThemeContainer.of(context).textFieldContentPadding;

    final iconSize = ThemeContainer.of(context).passwordSuffixIconSize;

    return Container(
      child: Stack(
        children: <Widget>[
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              contentPadding:
                  textFieldPadding.add(EdgeInsets.only(right: iconSize)),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: hintColor),
              labelStyle: TextStyle(decorationColor: underlineColor),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: underlineColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: underlineColor)),
            ),
          ),
          Positioned(
            bottom: textFieldPadding.bottom,
            right: 0,
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: SvgPicture.asset(
                _obscureText ? eyeIconPath : openEyeIconPath,
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
