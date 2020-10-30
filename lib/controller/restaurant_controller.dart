import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';

class RestaurantController {
  Future<RestaurantModel> getRestaurant(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/data/local_restaurant.json');
    var result = json.decode(data);

    return RestaurantModel.fromJson(result);
  }
}
