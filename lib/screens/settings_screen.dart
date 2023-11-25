import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/components/switch.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(String key, bool value) onChange;

  const SettingsScreen(
      {super.key, required this.onChange, required this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchItem(
                  title: 'Sem glúten',
                  subTitle: 'Só exibe refeições sem glúten',
                  value: widget.settings.isGlutenFree,
                  onChange: (value) {
                    widget.onChange('gluten', value);
                  },
                ),
                SwitchItem(
                  title: 'Sem lactose',
                  subTitle: 'Só exibe refeições sem lactose',
                  value: widget.settings.isLactoseFree,
                  onChange: (value) {
                    widget.onChange('lactose', value);
                  },
                ),
                SwitchItem(
                  title: 'Vegana',
                  subTitle: 'Só exibe refeições veganas',
                  value: widget.settings.isVegan,
                  onChange: (value) {
                    widget.onChange('vegan', value);
                  },
                ),
                SwitchItem(
                  title: 'Vegetariana',
                  subTitle: 'Só exibe refeições vegetarianas',
                  value: widget.settings.isVegetarian,
                  onChange: (value) {
                    widget.onChange('vegetarian', value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
