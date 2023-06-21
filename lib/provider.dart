import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider_example/models.dart';

final List<Model> sample = List.generate(50,
    (index) => Model("Movie $index", "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  final List<Model> _movies = sample;
  List<Model> get movies => _movies;

  final List<Model> _favList = [];
  List<Model> get favList => _favList;

  void addToList(Model movie) {
    _favList.add(movie);
    notifyListeners();
  }

  void removeFromList(Model movie) {
    _favList.remove(movie);
    notifyListeners();
  }
}
