import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:fylo_data_storage/ui/logo_card.dart';
import 'package:fylo_data_storage/ui/slider_card.dart';

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ui = CalculateUISizePerLayout();

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LogoCard(),
          SizedBox(width: ui.calculate({kRowLayout: 20})),
          SliderCard(),
        ],
      ),
    );
  }
}
