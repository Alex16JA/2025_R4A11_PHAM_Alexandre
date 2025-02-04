import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/viewmodels/counter_viewmodel.dart';

class CustomCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: counterViewModel.decrement,
        ),
        Text(
          '${counterViewModel.counter}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: counterViewModel.increment,
        ),
      ],
    );
  }
}
