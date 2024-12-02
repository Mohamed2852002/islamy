import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget {
  final String selected;
  const SelectedItem(this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selected,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ],
    );
  }
}
