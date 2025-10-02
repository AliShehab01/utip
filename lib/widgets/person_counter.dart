import 'package:flutter/material.dart';

class PersonCount extends StatelessWidget {
  const PersonCount({
    super.key,
    required this.toc,
    required int personCount,
    required this.onDecrement,
    required this.onIncrement,
  }) : _personCount = personCount;

  final ThemeData toc;
  final int _personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Split", style: toc.textTheme.titleMedium),
        Row(
          children: [
            IconButton(
              color: toc.colorScheme.primary,
              icon: Icon(Icons.remove),
              onPressed: onDecrement,
            ),
            Text(_personCount.toString(), style: toc.textTheme.titleMedium),
            IconButton(
              color: toc.colorScheme.primary,
              onPressed: onIncrement,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
