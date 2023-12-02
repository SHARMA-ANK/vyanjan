
import 'package:flutter/material.dart';
import 'package:vyanjan/data/category_data.dart';
import 'package:vyanjan/models/category.dart';
import 'package:vyanjan/models/meal.dart';
import 'package:vyanjan/widgets/category_grid_item.dart';
import 'package:vyanjan/screens/meals.dart';
<<<<<<< HEAD
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
=======
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,required this.availableMeals});
  //final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  void _selectedCategory(BuildContext context, Category category){
    final  _filteredList=widget.availableMeals
        .where((meal) => meal.categories.contains(category.id)
    ).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Meals_screen(title: category.title, meals: _filteredList
    )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController,
        child: GridView(
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
        ),
      builder: (context,child) => SlideTransition(
        position:Tween(
            begin: const Offset(0,0.3),
            end: const Offset(0,0)
        ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut)
        ),
        child: child,
      ),

      );
        


>>>>>>> 50a6e4a (Initial commit)

  }
}
