import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final int totalItems;
  final Widget? Function(BuildContext, int) itemBuilder;

  const ListTitle({
    super.key,
    required this.totalItems,
    required this.itemBuilder,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          width: 300,
          height: 250,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: totalItems,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
