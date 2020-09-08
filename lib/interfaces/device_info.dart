import 'package:flutter/widgets.dart';

abstract class DeviceInfo {
  double width();
  double height();
  Orientation orientation();
}

class Device implements DeviceInfo {
  static final Device instance = Device._privateConstructor();
  static BuildContext context;

  Device._privateConstructor();

  @override
  double height() {
    return MediaQuery.of(context).size.height;
  }

  @override
  double width() {
    return MediaQuery.of(context).size.width;
  }

  @override
  Orientation orientation() {
    return MediaQuery.of(context).orientation;
  }
}
