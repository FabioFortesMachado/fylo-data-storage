import 'package:flutter/material.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'my_icon.dart';

class LogoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ui = CalculateUISizePerLayout();

    return Container(
      padding: EdgeInsets.fromLTRB(
        ui.calculate({kRowLayout: 26, kColumnLayout: 36}),
        ui.calculate({kRowLayout: 26, kColumnLayout: 36}),
        ui.calculate({kRowLayout: 82, kColumnLayout: 56}),
        ui.calculate({kRowLayout: 26, kColumnLayout: 36}),
      ),
      decoration: BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            ui.calculate({kRowLayout: 8, kColumnLayout: 10}),
          ),
          bottomLeft: Radius.circular(
            ui.calculate({kRowLayout: 8, kColumnLayout: 10}),
          ),
          topLeft: Radius.circular(
            ui.calculate({kRowLayout: 8, kColumnLayout: 10}),
          ),
          topRight: Radius.circular(
            ui.calculate({kRowLayout: 60, kColumnLayout: 82}),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: ui.calculate({kRowLayout: 86, kColumnLayout: 116}),
          ),
          SizedBox(
            height: ui.calculate({kRowLayout: 20, kColumnLayout: 32}),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyIcon(iconData: Icons.insert_drive_file),
              SizedBox(
                width: ui.calculate({kRowLayout: 10, kColumnLayout: 14}),
              ),
              MyIcon(iconData: Icons.folder),
              SizedBox(
                width: ui.calculate({kRowLayout: 10, kColumnLayout: 14}),
              ),
              MyIcon(iconData: Icons.cloud_upload),
            ],
          )
        ],
      ),
    );
  }
}
