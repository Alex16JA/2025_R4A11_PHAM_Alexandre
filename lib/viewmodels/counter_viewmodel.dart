import 'package:flutter/foundation.dart';
import '/models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counterModel = CounterModel();

  int get counter => _counterModel.counter;

  void increment() {
    _counterModel.increment();
    notifyListeners();
  }

  void decrement() {
    _counterModel.decrement();
    notifyListeners();
  }
}
