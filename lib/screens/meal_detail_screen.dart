import 'package:flutter/material.dart';
import 'package:meals/components/list_title.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) isFavorite;
  final Function(Meal) onToggleFavorite;

  const MealDetailScreen(
      {super.key, required this.onToggleFavorite, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            ListTitle(
              title: 'Ingredientes',
              totalItems: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            ),
            ListTitle(
              title: 'Passos',
              totalItems: meal.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                    // color: Theme.of(context).colorScheme.primary,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Divider(),
                    ]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(meal)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
