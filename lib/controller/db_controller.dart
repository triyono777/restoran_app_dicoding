import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/database_helper.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';

class DBController extends ChangeNotifier {
  List<FavoriteModel> _listFavorites = [];
  DatabaseHelper _dbHelper;

  List<FavoriteModel> get listFavorites => _listFavorites;

  DBController() {
    _dbHelper = DatabaseHelper();
    getAllFavorite();
  }

  Future<void> addFavorite({FavoriteModel favorite}) async {
    await _dbHelper.insertFavorite(favorite);
    getAllFavorite();
  }

  Future<List<FavoriteModel>> getAllFavorite() async {
    _listFavorites = await _dbHelper.getFavorite();
    notifyListeners();
    return _listFavorites;
  }

  Future<void> deleteFavorite({String idFav}) async {
    await _dbHelper.deleteFavorite(idFav);
    getAllFavorite();
  }
}
