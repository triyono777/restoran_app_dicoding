import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/database_helper.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';

class DBController extends ChangeNotifier {
  List<FavoriteModel> _favorites = [];
  DatabaseHelper _dbHelper;

  List<FavoriteModel> get notes => _favorites;

  DBController() {
    _dbHelper = DatabaseHelper();
    getAllFavorite();
  }

  Future<void> addFavorite(FavoriteModel favorite) async {
    await _dbHelper.insertFavorite(favorite);
    getAllFavorite();
  }

  void getAllFavorite() async {
    _favorites = await _dbHelper.getFavorite();
    notifyListeners();
  }
}
