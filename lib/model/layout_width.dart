import 'package:flutter/widgets.dart';
import 'package:fylo_data_storage/interfaces/data.dart';
import 'package:fylo_data_storage/interfaces/device_info.dart';

//The size of the widgets depends on the width of the screen.
//For this layout its only the screen width
class ColumnLayoutWidth implements Data<double> {
  @override
  double get() {
    return Device.instance.width();
  }
}

/*
The size of the widgets depends on the width of the screen.
Here I want to make the most of the width on small devices,
but on large devices I want the width to be smaller,
so I used a linear interpolation
with min value of 40 and max value 382.
*/
class RowLayoutWidth implements Data<double> {
  final double x1;
  final double y1;
  final double x2;
  final double y2;

  RowLayoutWidth({
    @required this.x1,
    @required this.y1,
    @required this.x2,
    @required this.y2,
  });

  @override
  double get() {
    var width = Device.instance.width();

    if (Device.instance.orientation() == Orientation.portrait) {
      return width - 40;
    }

    return width -
        (y1 + (y2 - y1) / (x2 - x1) * (width - x1)).clamp(40.0, 382.0);
  }
}
