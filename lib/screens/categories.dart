
import 'package:flutter/material.dart';
import 'package:vyanjan/data/category_data.dart';
import 'package:vyanjan/models/category.dart';
import 'package:vyanjan/models/meal.dart';
import 'package:vyanjan/widgets/category_grid_item.dart';
import 'package:vyanjan/screens/meals.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggleFavorite,required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _selectedCategory(BuildContext context, Category category){
    final  _filteredList=availableMeals
        .where((meal) => meal.categories.contains(category.id)
    ).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Meals_screen(title: category.title, meals: _filteredList,
    onToggleFavorite: onToggleFavorite,)));
  }
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5
        ),
        children: [
          for(final category in availableCategories)
            Category_grid_items(category: category,onSelectCategory: (){_selectedCategory(context,category);},)


        ],
      );

  }
}
