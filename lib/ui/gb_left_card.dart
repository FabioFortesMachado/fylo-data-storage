import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:fylo_data_storage/model/data_by_layout.dart';
import 'package:fylo_data_storage/model/layout.dart';
import 'package:fylo_data_storage/ui/speech_balloon_border.dart';

class GBLeftCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ui = CalculateUISizePerLayout();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ui.calculate(
          {kColumnLayout: 18, kRowLayout: 16},
        ),
      ),
      decoration: DataByLayout(
        {
          kColumnLayout: BoxDecoration(
            color: kPaleBlue,
            borderRadius: BorderRadius.circular(
              ui.calculate({kColumnLayout: 8, kRowLayout: 6}),
            ),
          ),
          kRowLayout: ShapeDecoration(
            color: kPaleBlue,
            shape: SpeechBalloonBorder(radius: 6),
          ),
        },
        DecideBetweenTwoLayouts(),
      ).get(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Consumer<ValueNotifier<double>>(
            builder: (_, gb, __) => Text(
              '${1000 - gb.value.truncate()}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: kVeryDarkBlue,
                    fontSize: ui.calculate(
                      {kColumnLayout: 36, kRowLayout: 24},
                    ),
                  ),
            ),
          ),
          SizedBox(
            width: ui.calculate({kColumnLayout: 6, kRowLayout: 4}),
          ),
          Text(
            'GB LEFT',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: kGrayishBlue,
                  fontSize: ui.calculate(
                    {kColumnLayout: 12, kRowLayout: 7},
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
