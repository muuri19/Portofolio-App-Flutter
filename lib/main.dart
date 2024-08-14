import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muuri_project/config/initSupabase.dart';
import 'package:muuri_project/pages/home_page.dart';
import 'package:muuri_project/pages/ide_page.dart';
import 'package:muuri_project/pages/profile_page.dart';
import 'package:muuri_project/pages/project_page.dart';

Future<void> main() async {
  await initSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muuri Developer',
      theme: ThemeData(
          useMaterial3: true,
          textTheme:
              GoogleFonts.jetBrainsMonoTextTheme(Theme.of(context).textTheme)),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        IdePage.routeName: (context) => const IdePage(),
        ProjectPage.routeName: (context) => const ProjectPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
