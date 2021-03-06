import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/detail_restaurant_model.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;
import 'package:http/http.dart' as http;

class RestaurantController extends ChangeNotifier {
  http.Response _response;
  RestaurantModel restaurantModel;
  DetailRestaurantModel detailRestaurantModel;
  bool showSearch = false;
  bool isFavorite = false;

  toggleSearch() {
    showSearch = !showSearch;
    notifyListeners();
  }

  toggleFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  // untuk get all restaurant
  Future<RestaurantModel> getRestaurantAll() async {
    try {
      _response = await http.get(helper.list);
      var result = json.decode(_response.body);
      restaurantModel = RestaurantModel.fromJson(result);
      notifyListeners();
      return restaurantModel;
    } catch (e) {
      throw Exception('Failed to load restaurant: $e');
    }
  }

// get detail restaurant
  Future<DetailRestaurantModel> getDetailRestaurant(String idRestaurant) async {
    try {
      _response = await http.get(helper.detail + idRestaurant);
      var result = json.decode(_response.body);
      detailRestaurantModel = DetailRestaurantModel.fromJson(result);
      notifyListeners();
      return detailRestaurantModel;
    } catch (e) {
      throw Exception('Failed to load detail restaurant: $e');
    }
  }

  // pencarian restaurant
  Future<RestaurantModel> searchRestaurant(String search) async {
    try {
      _response = await http.get(helper.search + search);
      var result = json.decode(_response.body);
      restaurantModel = RestaurantModel.fromJson(result);
      notifyListeners();

      return restaurantModel;
    } catch (e) {
      throw Exception('Failed to load search restaurant: $e');
    }
  }

  // add review
  Future<bool> addReview({String review, String name, String id}) async {
    try {
      _response = await http.post(
        helper.review,
        body: {
          'id': id,
          'name': name,
          'review': review,
        },
      );
      var result = json.decode(_response.body);
      getRestaurantAll();
      return result['error'];
    } catch (e) {
      throw Exception('Failed to add review restaurant: $e');
    }
  }
}
