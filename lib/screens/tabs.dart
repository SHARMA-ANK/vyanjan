// ignore_for_file: non_constant_identifier_names

import 'package:vyanjan/data/category_data.dart';
import 'package:vyanjan/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:vyanjan/screens/categories.dart';
import 'package:vyanjan/screens/filters.dart';
import 'package:vyanjan/screens/meals.dart';
import 'package:vyanjan/widgets/main_drawer.dart';

const kInitialFilters ={
  Filter.glutenFree:false,

  Filter.vegan:false,
  Filter.lactoseFree:false,
  Filter.Vegetarian:false,

};
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex=0;
  final List<Meal> _favoriteMeals=[];

  Map<Filter,bool> _selectedFilters={
    Filter.glutenFree:false,

    Filter.vegan:false,
    Filter.lactoseFree:false,
    Filter.Vegetarian:false,

  };
  void _setScreen(String identifier) async{
     Navigator.of(context).pop();
    if(identifier=='filters'){
      final result= await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(
          builder: (ctx)=>FiltersScreen(currentFilters: _selectedFilters,)),);
      setState(() {
        _selectedFilters=result ?? kInitialFilters ;
      });
    }


  }

  void _showInfoMessage(String Message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(Message)),
    );
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  void _toggleMealFavoriteStatus(Meal meal){
    final isExisting=_favoriteMeals.contains(meal);
    setState(() {
      if(isExisting){
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal No Longer a favorite Meal");
      }else {
        _favoriteMeals.add(meal);
        _showInfoMessage("Meal added to favorite Meal");

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    final availableMeals=dummyMeals.where((meal) {
      if(_selectedFilters[Filter.glutenFree]!&&!meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]!&&!meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.Vegetarian]!&&!meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]!&&!meal.isVegan){
        return false;
      }
      return true;
    }).toList();
    Widget activePage=CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,availableMeals: availableMeals,);
    var activePageTitle='Categories';
    if(_selectedPageIndex==1){
      activePageTitle="yourFavorites";
      activePage=Meals_screen( meals: _favoriteMeals,onToggleFavorite: _toggleMealFavoriteStatus,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favourites"),

        ],
      ),
    );
  }
}
