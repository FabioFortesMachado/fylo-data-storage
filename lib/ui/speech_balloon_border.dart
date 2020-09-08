import 'package:flutter/material.dart';

class SpeechBalloonBorder extends ShapeBorder {
  final double radius;

  SpeechBalloonBorder({this.radius});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight);
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.right, rect.bottom - radius)
      ..relativeLineTo(0.0, rect.height / 2.5)
      ..lineTo(rect.right - rect.width / 8, rect.bottom)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
