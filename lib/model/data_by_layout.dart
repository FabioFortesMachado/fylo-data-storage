import 'package:fylo_data_storage/interfaces/data.dart';

class DataByLayout<T> implements Data<T> {
  final Map<String, T> items;
  final Data<String> layout;

  DataByLayout(this.items, this.layout);

  @override
  T get() {
    return items.containsKey(layout.get()) ? items[layout.get()] : null;
  }
}
