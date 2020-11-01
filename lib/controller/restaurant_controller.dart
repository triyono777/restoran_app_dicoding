import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;
import 'package:http/http.dart' as http;

class RestaurantController {
  http.Response _response;

  Future<RestaurantModel> getRestaurant() async {
    _response = await http.get(helper.list);
    var result = json.decode(_response.body);
    return RestaurantModel.fromJson(result);
  }
}
