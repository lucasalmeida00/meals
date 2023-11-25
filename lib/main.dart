import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import './screens/categories_meals_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                    color: Colors.white),
              ),
        ),
        routes: {
          AppRoutes.HOME: (ctx) => const TabsScreen(),
          AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
          AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
          AppRoutes.SETTINGS: (context) => const SettingsScreen(),
        });
  }
}
