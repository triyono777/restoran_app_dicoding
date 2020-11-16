import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/database_helper.dart';
import 'package:restoran_app_dicoding/model/detail_restaurant_model.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';

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
    List<RestaurantData> listRest;
    _listFavorites = await _dbHelper.getFavorite();
    notifyListeners();
    return _listFavorites;
  }
}
