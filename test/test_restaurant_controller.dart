import 'package:flutter_test/flutter_test.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/controller/scheduling_provider.dart';

void main() {
  test('Get name restaurant', () async {
    final restaurantData = await RestaurantController().getRestaurantAll();
    var restaurantName = restaurantData.restaurants[0];
    expect(restaurantName.name, "Melting Pot");
  });
}
