import 'package:flutter/material.dart';

import '../utils/logger.dart';
// import 'package:logging/logging.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Logger().debug('Home Page');
              // print(1);
            },
            child: const Center(child: Text('Home Page'))));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    // final Symbol #symbol
    final Symbol symbol1 = #symbol;

    final Symbol symbol2 = Symbol('symbol');
    print(symbol1 == symbol2); // false

    return const Placeholder();
  }
}
