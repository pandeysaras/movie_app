import 'package:flutter/material.dart';
import 'package:movie_app/utils/routing/routes.dart';
import 'package:movie_app/utils/routing/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.movieListScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


