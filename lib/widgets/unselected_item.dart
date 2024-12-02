import 'package:flutter/material.dart';

class UnSelectedItem extends StatelessWidget {
  final String unselected;
  const UnSelectedItem(this.unselected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      unselected,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
