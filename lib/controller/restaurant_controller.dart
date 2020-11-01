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

  Future<RestaurantModel> getRestaurantAll() async {
    _response = await http.get(helper.list);
    var result = json.decode(_response.body);
    restaurantModel = RestaurantModel.fromJson(result);
    notifyListeners();
    return restaurantModel;
  }

  Future<DetailRestaurantModel> getDetailRestaurant(String idRestaurant) async {
    _response = await http.get(helper.detail + idRestaurant);
    var result = json.decode(_response.body);
    detailRestaurantModel = DetailRestaurantModel.fromJson(result);
    notifyListeners();
    return detailRestaurantModel;
  }
}
