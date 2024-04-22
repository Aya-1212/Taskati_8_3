import 'package:flutter/material.dart';

TextStyle getTitleFont(context,
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: colors ?? Theme.of(context).colorScheme.primary,
    fontSize: fontSize ?? 22,
    fontWeight: (fontWeight) ?? FontWeight.bold,
  );
}

TextStyle getBodyFont(context,
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: (colors) ?? Theme.of(context).colorScheme.onSurface,
    fontSize: (fontSize) ?? 20,
    fontWeight: (fontWeight) ?? FontWeight.w500,
  );
}

TextStyle getSmallFont(context,
    { Color? colors,
     double? fontSize,
     FontWeight? fontWeight}) {
  return TextStyle(
    color: (colors) ?? Theme.of(context).colorScheme.onSurface,
    fontSize: (fontSize) ?? 18,
    fontWeight: (fontWeight) ?? FontWeight.w300,
  );
}
