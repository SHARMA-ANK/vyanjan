import 'package:flutter/material.dart';
import 'package:vyanjan/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vyanjan/providers/favorite_provider.dart';
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key,required this.meal,});
  final Meal meal;
  //final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals=ref.watch(favoriteMealsProvider);
    final isFavorite= favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            //onToggleFavorite(meal);
            // don't use watch because passing a function int the on pressed instead use read to access value one time only
            final wasAdded=ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteMealStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                wasAdded? 'Meal added as Favorite' : 'Meal Removed from Favorite'
              )),
            );
          }, icon:AnimatedSwitcher(
                duration:Duration(milliseconds: 300) ,
            transitionBuilder: (child,animation){
                  return RotationTransition(
                    turns: Tween(begin: 0.9,end: 1.0).animate(animation),
                    child: child,);
            },
            child: Icon(isFavorite?Icons.star: Icons.star_border,
              key: ValueKey(isFavorite),
            ),

          ) ,
          ),
        ],
      ),body: SingleChildScrollView(
        child: Column(
        children: [
          Hero(
            tag: meal.id,
            child: Image.network(

              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,

            ),
          ),
          const SizedBox(height: 14,),
          Text("Ingerdients", style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
          ),
          const SizedBox(height: 14,),
          for(final ingredient in meal.ingredients)
            Text(ingredient,style:Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          const SizedBox(height: 24,),
          Text(
            "Steps",
            style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 14,),
          for(final step in meal.steps)
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Text(step,style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
            ),


        ],
    ),
      )
    );
  }
}
