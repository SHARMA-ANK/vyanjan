import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vyanjan/models/meal.dart';
class FavoriteMealNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealNotifier() : super([]);
  //we cant use the function add remove for adding and removing the data in the favorite list in
  // the notifier method as it is already hardcoded not to use it the value will remain same
  //at each time u need to create new memory
  bool toggleMealFavoriteMealStatus(Meal meal){
    final mealIsFavorite=state.contains(meal);
    if(mealIsFavorite){
      state =state.where((m) => m.id!=meal.id).toList();return false;
    }else{
      state=[...state,meal];return true; //adding new meal to the newly created list
    }
  }
}
final favoriteMealsProvider= StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref){
  return FavoriteMealNotifier();
});