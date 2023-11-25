import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import './screens/categories_meals_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _availableMeals = DUMMY_MEALS;
  Settings settings = Settings();

  _onChangeSettings(String key, bool value) {
    switch (key) {
      case 'gluten':
        setState(() {
          settings.isGlutenFree = value;
        });
        break;
      case 'lactose':
        setState(() {
          settings.isLactoseFree = value;
        });
        break;
      case 'vegan':
        setState(() {
          settings.isVegan = value;
        });
        break;
      case 'vegetarian':
        setState(() {
          settings.isVegetarian = value;
        });
        break;
      default:
        break;
    }
  }

  List<Meal> _filterMeals() {
    return _availableMeals.where((meal) {
      final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
      final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
      final filterVegan = settings.isVegan && !meal.isVegan;
      final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
      return !filterGluten &&
          !filterLactose &&
          !filterVegan &&
          !filterVegetarian;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamos Cozinhar?',
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.pink,
          hintColor: Colors.amberAccent,
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
                titleMedium: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                    color: Colors.grey),
              ),
        ),
        routes: {
          AppRoutes.HOME: (ctx) => const TabsScreen(),
          AppRoutes.CATEGORIES_MEALS: (ctx) =>
              CategoriesMealsScreen(_filterMeals()),
          AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
          AppRoutes.SETTINGS: (context) =>
              SettingsScreen(onChange: _onChangeSettings, settings: settings)
        });
  }
}
