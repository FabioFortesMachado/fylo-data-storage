import 'package:device_preview/device_preview.dart' as preview;
import 'package:flutter/material.dart';
import 'package:fylo_data_storage/home.dart';
import 'package:fylo_data_storage/model/calculate_ui_size.dart';
import 'package:fylo_data_storage/model/layout_width.dart';
import 'model/layout.dart';
import 'package:fylo_data_storage/model/constants.dart';
import 'package:provider/provider.dart';
import 'package:fylo_data_storage/interfaces/device_info.dart';

void main() {
  runApp(ChangeNotifierProvider<ValueNotifier<double>>.value(
      value: ValueNotifier<double>(156.0),
      child: preview.DevicePreview(builder: (_) => MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: preview.DevicePreview.appBuilder,
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
              bodyText1: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: kPaleBlue,
                    fontWeight: FontWeight.w700,
                  ),
            )
            .apply(fontFamily: 'Raleway'),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Home(),
      ),
    );
  }

  void init(BuildContext context) {
    DecideBetweenTwoLayouts.breakpoint = 496;
    Device.context = context;

    CalculateUISizePerLayout.baseValues = {kColumnLayout: 320, kRowLayout: 578};
    CalculateUISizePerLayout.deviceWidth = {
      kColumnLayout: ColumnLayoutWidth(),
      kRowLayout: RowLayoutWidth(
        x1: 568,
        y1: 40,
        x2: 960,
        y2: 382,
      ),
    };
  }
}
