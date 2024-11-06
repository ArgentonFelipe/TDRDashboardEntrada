import 'package:signals_flutter/signals_flutter.dart';

class LocalFilterStore {
  LocalFilterStore();

  final local = signal<int>(0);

  void changeLocalFilterValue(int? newValue) {
    local.value = newValue ?? 0;
  }

  void cleanFilter() {
    local.value = 0;
  }
}
