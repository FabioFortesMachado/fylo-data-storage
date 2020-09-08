import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/constants.dart';

class GradientSlider extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx + trackHeight / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width - trackHeight;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    if (sliderTheme.trackHeight <= 0) {
      return;
    }

    final Paint backgroundPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor
      ..style = PaintingStyle.fill;

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Path sliderBackTrack = Path()
      ..addRRect(
        RRect.fromLTRBR(
          trackRect.left - trackRect.height / 2,
          trackRect.top,
          trackRect.right + trackRect.height / 2,
          trackRect.bottom,
          Radius.circular(trackRect.height / 2),
        ).inflate(1.5),
      );

    final Path sliderTrack = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
            trackRect.left - trackRect.height / 2,
            trackRect.top,
            thumbCenter.dx + trackRect.height / 2,
            trackRect.bottom,
          ),
          Radius.circular(trackRect.height / 2),
        ),
      );

    context.canvas.drawPath(sliderBackTrack, backgroundPaint);
    context.canvas.drawPath(
      sliderTrack,
      Paint()
        ..shader = kSliderTrackGradient.createShader(
          Rect.fromLTRB(
              sliderTrack.getBounds().left,
              sliderTrack.getBounds().top,
              sliderTrack.getBounds().right,
              sliderTrack.getBounds().bottom),
        ),
    );
  }
}
