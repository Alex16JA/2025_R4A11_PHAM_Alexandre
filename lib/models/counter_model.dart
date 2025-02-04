class CounterModel {
  int counter;

  CounterModel({this.counter = 0});

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }
}
