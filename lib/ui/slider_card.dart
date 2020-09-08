import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/data_by_layout.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:fylo_data_storage/model/layout.dart';
import 'package:fylo_data_storage/ui/gb_left_card.dart';
import 'package:fylo_data_storage/ui/gradient_slider.dart';
import 'package:provider/provider.dart';

class SliderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ui = CalculateUISizePerLayout();
    var gb = Provider.of<ValueNotifier<double>>(context);

    var textTheme = Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: ui.calculate({kRowLayout: 9, kColumnLayout: 12}),
        );

    return Stack(
      overflow: Overflow.visible,
      alignment: DataByLayout<Alignment>(
        {
          kColumnLayout: Alignment.center,
          kRowLayout: Alignment(0.78, 0.0),
        },
        DecideBetweenTwoLayouts(),
      ).get(),
      children: [
        Container(
          width: ui.calculate({kRowLayout: 340}),
          padding: DataByLayout<EdgeInsets>(
            {
              kRowLayout: EdgeInsets.all(ui.calculate({kRowLayout: 26})),
              kColumnLayout: EdgeInsets.fromLTRB(
                  ui.calculate({kColumnLayout: 26}),
                  ui.calculate({kColumnLayout: 26}),
                  ui.calculate({kColumnLayout: 26}),
                  ui.calculate({kColumnLayout: 40})),
            },
            DecideBetweenTwoLayouts(),
          ).get(),
          // EdgeInsets.all(
          //   layout.calculate({kRowLayout: 26, kColumnLayout: 26}),
          // ),
          decoration: BoxDecoration(
            color: kDarkBlue,
            borderRadius: BorderRadius.circular(
              ui.calculate({kRowLayout: 8, kColumnLayout: 10}),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: DataByLayout<CrossAxisAlignment>(
              {
                kColumnLayout: CrossAxisAlignment.center,
                kRowLayout: CrossAxisAlignment.start,
              },
              DecideBetweenTwoLayouts(),
            ).get(),
            children: [
              RichText(
                text: TextSpan(
                  style: textTheme,
                  children: [
                    TextSpan(
                        text: 'You\'ve used ',
                        style: textTheme.copyWith(
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                      text: '${gb.value.truncate()} GB',
                      style: textTheme,
                    ),
                    TextSpan(
                      text: ' of your storage',
                      style: textTheme.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ui.calculate({kRowLayout: 4, kColumnLayout: 8}),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackShape: GradientSlider(),
                  trackHeight: ui.calculate(
                    {kRowLayout: 9, kColumnLayout: 12},
                  ),
                  inactiveTrackColor: kInactiveTrackColor,
                  thumbColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: ui.calculate(
                      {kRowLayout: 3, kColumnLayout: 4},
                    ),
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: ui.calculate(
                      {kRowLayout: 12, kColumnLayout: 16},
                    ),
                  ),
                ),
                child: Slider(
                  min: 0.0,
                  max: 1000.0,
                  value: gb.value,
                  onChanged: (newValue) {
                    gb.value = newValue;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '0 GB',
                    style: textTheme.copyWith(
                      fontSize: ui.calculate(
                        {kRowLayout: 7, kColumnLayout: 10},
                      ),
                    ),
                  ),
                  Text(
                    '1000 GB',
                    style: textTheme.copyWith(
                      fontSize: ui.calculate(
                        {kRowLayout: 7, kColumnLayout: 10},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataByLayout<Positioned>(
          {
            kColumnLayout: Positioned(
              height: ui.calculate({kColumnLayout: 60}),
              bottom: ui.calculate({kColumnLayout: -30}),
              child: GBLeftCard(),
            ),
            kRowLayout: Positioned(
              height: ui.calculate({kRowLayout: 45}),
              top: ui.calculate({kRowLayout: -30}),
              child: GBLeftCard(),
            ),
          },
          DecideBetweenTwoLayouts(),
        ).get(),
      ],
    );
  }
}
