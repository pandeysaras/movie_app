
import 'package:flutter/material.dart';
import 'package:movie_app/utils/routing/routes_name.dart';
import 'package:movie_app/view/movie_description_screen.dart';
import 'package:movie_app/view/movie_list_screen.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RouteName.movieListScreen:
        return MaterialPageRoute(builder: (context) => MovieListScreen());
      case RouteName.movieDescriptionScreen:
        return MaterialPageRoute(builder: (context) => MovieDescriptionSreen(description: settings.arguments.toString(),));

      default :
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body:  Center(child: Text('No route defined')),
          );
        });
    }
  }
}