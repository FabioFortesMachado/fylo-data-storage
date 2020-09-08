import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/constants.dart';

class MyIcon extends StatelessWidget {
  final IconData iconData;

  MyIcon({this.iconData});

  @override
  Widget build(BuildContext context) {
    var layout = CalculateUISizePerLayout();

    return Container(
      padding: EdgeInsets.all(
        layout.calculate({kRowLayout: 6, kColumnLayout: 9}),
      ),
      decoration: BoxDecoration(
        color: kVeryDarkBlue,
        borderRadius: BorderRadius.circular(
          layout.calculate({kRowLayout: 6, kColumnLayout: 9}),
        ),
      ),
      child: Icon(
        iconData,
        color: kIconColor,
        size: layout.calculate({kRowLayout: 18, kColumnLayout: 24}),
      ),
    );
  }
}
