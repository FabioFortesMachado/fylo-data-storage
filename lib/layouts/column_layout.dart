import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:fylo_data_storage/ui/logo_card.dart';
import 'package:fylo_data_storage/ui/slider_card.dart';

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ui = CalculateUISizePerLayout();

    return Center(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(
          vertical: ui.calculate({kColumnLayout: 26}),
          horizontal: ui.calculate({kColumnLayout: 18}),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LogoCard(),
            SizedBox(height: ui.calculate({kColumnLayout: 14})),
            SliderCard(),
          ],
        ),
      ),
    );
  }
}
