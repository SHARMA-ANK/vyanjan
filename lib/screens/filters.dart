import 'package:flutter/material.dart';
import 'package:vyanjan/screens/tabs.dart';
import 'package:vyanjan/widgets/main_drawer.dart';
enum Filter{
  glutenFree,
  lactoseFree,
  Vegetarian,
  vegan
}
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilters});
  final Map<Filter,bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeScreenState = false;
  var _lactoseFreeScreenState = false;
  var _vegetarianScreenState = false;
  var _veganScreenState = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeScreenState=widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeScreenState=widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianScreenState=widget.currentFilters[Filter.Vegetarian]!;
    _veganScreenState=widget.currentFilters[Filter.vegan]!;

  }
  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(// it is utility widget allows you on willpop
        onWillPop: () async{
          Navigator.of(context).pop({
              Filter.glutenFree:_glutenFreeScreenState,
            Filter.vegan:_veganScreenState,
            Filter.lactoseFree:_lactoseFreeScreenState,
            Filter.Vegetarian:_vegetarianScreenState,
          });
          return false; //because we are popping the screen manually and doesnt wnat to pop two times
        },
        child: Column(
          children: [
            SwitchListTile(
                value:_glutenFreeScreenState ,
                onChanged: (isChecked){
                  setState(() {
                    _glutenFreeScreenState=isChecked;
                  });
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
              value:_lactoseFreeScreenState ,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeScreenState=isChecked;
                });
              },
              title: Text(
                'Vegetarian',
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
              value:_vegetarianScreenState ,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianScreenState=isChecked;
                });
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
              value:_veganScreenState ,
              onChanged: (isChecked){
                setState(() {
                  _veganScreenState=isChecked;
                });
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
      ),
    );
  }
}
