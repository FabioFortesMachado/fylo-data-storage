import 'package:fylo_data_storage/interfaces/device_info.dart';
import 'package:fylo_data_storage/interfaces/data.dart';
import 'constants.dart';

class DecideBetweenTwoLayouts implements Data<String> {
  static int breakpoint;
  final DeviceInfo deviceInfo = Device.instance;

  @override
  String get() {
    return deviceInfo.width() < breakpoint ? kColumnLayout : kRowLayout;
  }
}
