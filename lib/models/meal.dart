// ignore_for_file: constant_identifier_names

enum Complexity {
  simple,
  challenging,
  medium,
  difficult,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  // final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Cost cost;

  // Constructor
  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    // required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.cost,
  });
}
