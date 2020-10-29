import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            Expanded(
              child: FutureBuilder<RestaurantModel>(
                future: RestaurantController().getRestaurant(context),
                builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : snapshot.hasError
                        ? Text('terjadi kesalahan load data')
                        : AnimationLimiter(
                            child: ListView.builder(
                              itemCount: snapshot.data.restaurants.length,
                              itemBuilder: (ctx, index) => AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          DetailRestaurantPage.routeName,
                                          arguments: snapshot.data.restaurants[index],
                                        );
                                      },
                                      child: ItemListRestaurant(
                                        restaurants: snapshot.data.restaurants[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Restaurant',
            style: TextStyle(fontSize: 30),
          ),
          Text('Recomended Restaurants for you'),
        ],
      ),
    );
  }
}
