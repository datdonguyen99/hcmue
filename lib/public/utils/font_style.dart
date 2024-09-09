import 'package:flutter/material.dart';

import 'font_families.dart';
import 'constant.dart';

TextStyle getTextStyle({fontFamily, double? fontSize, Color? color}) {
  return TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: color);
}

TextStyle openSansRegularStyle({double? fontSize = 12, color = darkGray}) {
  return getTextStyle(
    fontFamily: OpenSans.regular,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle openSansMediumStyle({double? fontSize = 12, color = darkGray}) {
  return getTextStyle(
    fontFamily: OpenSans.medium,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle openSansLightStyle({double? fontSize = 12, color = darkGray}) {
  return getTextStyle(
    fontFamily: OpenSans.light,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle openSansBoldStyle({double? fontSize = 12, color = darkGray}) {
  return getTextStyle(
    fontFamily: OpenSans.bold,
    fontSize: fontSize,
    color: color,
  );
}
