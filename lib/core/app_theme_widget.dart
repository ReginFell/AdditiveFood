import 'package:flutter/material.dart';

class ThemeContainer extends StatefulWidget {
  final Widget child;

  static AppThemeState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .theme;
  }

  ThemeContainer({@required this.child});

  @override
  AppThemeState createState() {
    return AppThemeState();
  }
}

class AppThemeState extends State<ThemeContainer> {
  double get spacingUnit => 16.0;
  double get bottomMenuIconHeight => 22.0;

  Color get colorAccent => Color(0xFFb5b5b5);
  Color get textColor => Color(0xFF6E0091);
  Color get colorAccentSecondary => Color(0xFF56FFAB);
  Color get hintColor => Color(0xFF6E0091);
  Color get textFieldUnderlineColor => Color(0xFF56FFAB);

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      theme: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final AppThemeState theme;

  _InheritedStateContainer({
    Key key,
    @required this.theme,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
