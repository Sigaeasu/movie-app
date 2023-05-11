import 'package:flutter/material.dart';
import 'package:movieapp/screens/screens.dart';

final appRoutes = <String, WidgetBuilder>{
  // MainPage.routeName: (context) => MainPage(),
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => LoginPage(),
  MoviesPage.routeName: (context) => MoviesPage(),
  MovieListPage.routeName: (context) => MovieListPage(),
  FavoritesPage.routeName: (context) => FavoritesPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
};
