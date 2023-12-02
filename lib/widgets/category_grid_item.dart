// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:vyanjan/models/category.dart';
class Category_grid_items extends StatelessWidget {
  const Category_grid_items({super.key,required this.category,required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell( // using inkwell instead oif gesture detector as it also have feature of givinf feedback
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
