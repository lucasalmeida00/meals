import 'package:flutter/material.dart';

class SwitchItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool) onChange;

  const SwitchItem({
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      value: value,
      onChanged: onChange,
    );
  }
}
