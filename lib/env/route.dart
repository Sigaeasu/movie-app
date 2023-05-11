import 'package:flutter/material.dart';
import 'package:movieapp/screens/screens.dart';

final appRoutes = <String, WidgetBuilder>{
  // MainPage.routeName: (context) => MainPage(),
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => LoginPage(),
  MoviesPage.routeName: (context) => MoviesPage(),
  MovieListPage.routeName: (context) => MovieListPage(),
  MovieDetailPage.routeName: (context) => MovieDetailPage(),
  FavoritesPage.routeName: (context) => FavoritesPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
};
