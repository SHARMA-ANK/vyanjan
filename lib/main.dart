import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'package:google_fonts/google_fonts.dart';
import 'package:vyanjan/screens/tabs.dart';
import 'package:vyanjan/screens/meals.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyanjan/screens/tabs.dart';
>>>>>>> 50a6e4a (Initial commit)

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
<<<<<<< HEAD
  runApp(const App());
=======
  runApp(const ProviderScope(child: App()));
>>>>>>> 50a6e4a (Initial commit)
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: const TabsScreen(),
    );
  }
}