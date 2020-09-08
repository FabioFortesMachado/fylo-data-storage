import 'package:flutter/material.dart';
import 'package:fylo_data_storage/layouts/column_layout.dart';
import 'package:fylo_data_storage/layouts/row_layout.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:fylo_data_storage/model/data_by_layout.dart';
import 'package:fylo_data_storage/model/layout.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-desktop.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: DataByLayout<Widget>(
        {
          kColumnLayout: ColumnLayout(),
          kRowLayout: RowLayout(),
        },
        DecideBetweenTwoLayouts(),
      ).get(),
    );
  }
}
