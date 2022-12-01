import 'package:flutter/material.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:flutter_testing_workshop/counter/widgets/counter_button.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    super.key,
    this.counterRepository,
  });

  final CounterRepository? counterRepository;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterRepository counterRepository;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    counterRepository = widget.counterRepository ?? CounterRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                '${counterRepository.value}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 120,
                  color: Colors.blue,
                ),
                key: const Key('counter_value_key'),
              ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterButton(
            onPressed: () async {
              setState(() => isLoading = true);
              await counterRepository.decrease();
              setState(() => isLoading = false);
            },
            icon: Icons.remove,
            tooltip: 'Decrease',
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 4),
          CounterButton(
            onPressed: () async {
              setState(() => isLoading = true);
              await counterRepository.reset();
              setState(() => isLoading = false);
            },
            icon: Icons.restore,
            tooltip: 'Reset',
          ),
          const SizedBox(width: 4),
          CounterButton(
            onPressed: () async {
              setState(() => isLoading = true);
              await counterRepository.increase();
              setState(() => isLoading = false);
            },
            icon: Icons.add,
            tooltip: 'Increase',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
