import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/widgets/custom/percentage_positioned.dart';

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
               Logger('Home Page');
            },
            child: PercentagePositioned(
                relativeWidget: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(color: Colors.blue)),
                // isRelativeWidgetPositioned: true,
                relativeWidgetData: const PositionData(left: 50, top: 30),
                positionedChildren: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.red),
                  )
                ],
                positionedChildrenData: const [
                  PositionData(left: 0.2, top: 0.5)
                ])));
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
