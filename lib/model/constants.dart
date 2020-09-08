import 'package:flutter/material.dart';

const double rowLayoutAspectRatio = 578 / 127.5;
const double invertedRowLayoutAspectRatio = 1 / rowLayoutAspectRatio;

const String kRowLayout = 'rowLayout';
const String kColumnLayout = 'columnLayout';

const Color kPaleBlue = Color(0xFFDDDBFF);
const Color kGrayishBlue = Color(0xFF848794);
const Color kDarkBlue = Color(0xFF1D2C67);
const Color kVeryDarkBlue = Color(0xFF0C122C);
const Color kIconColor = Color(0xff697fd4);
const Color kInactiveTrackColor = Color(0xff151e49);

const TextStyle myBoldStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: kPaleBlue,
);

final LinearGradient kSliderTrackGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFFFBAB3),
    Color(0xFFFF4D97),
  ],
);
