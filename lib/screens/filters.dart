// ignore_for_file: constant_identifier_names
import 'package:vyanjan/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),

      ),
      /*drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop();
        if(identifier=='meals'){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const TabsScreen()));
        }
      },),*/
      body: Column(
          children: [
            SwitchListTile(
                value:activeFilters[Filter.glutenFree]! ,
                onChanged: (isChecked){
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text("Only Include Gluten free Meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),

            ),
            SwitchListTile(
              value:activeFilters[Filter.lactoseFree]! ,
              onChanged: (isChecked){

                  ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);


              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text("Only Include lactose free Meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),

            ),
            SwitchListTile(
              value:activeFilters[Filter.Vegetarian]! ,
              onChanged: (isChecked){

                  ref.read(filtersProvider.notifier).setFilter(Filter.Vegetarian, isChecked);


              },
              title: Text(
                'vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text("Only Include vegetarian Meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),

            ),
            SwitchListTile(
              value:activeFilters[Filter.vegan]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);


              },
              title: Text(
                'vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text("Only Include vegan Meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),

            )
          ],
        ),
      //),
    );
  }
}
