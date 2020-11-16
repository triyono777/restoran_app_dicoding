import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/page/favorite_page.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/Homepage';
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var restaurant = Provider.of<RestaurantController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            _buildListRestaurant(restaurant, context),
          ],
        ),
      ),
    );
  }

  Expanded _buildListRestaurant(RestaurantController restaurant, BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          restaurant.getRestaurantAll();
        },
        child: FutureBuilder<RestaurantModel>(
          future: restaurant.getRestaurantAll(),
          builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: Lottie.asset(
                    'assets/animation/loading-animation.json',
                  ),
                )
              : snapshot.hasError
                  ? Text('terjadi kesalahan load data ${snapshot.error}')
                  : Consumer<RestaurantController>(
                      builder: (ctx, restaurant, ch) => AnimationLimiter(
                        child: restaurant.restaurantModel.restaurants.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'assets/animation/empty.json',
                                    ),
                                    Text('Restaurant tidak ditemukan')
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: restaurant.restaurantModel.restaurants.length,
                                itemBuilder: (ctx, index) => itemList(index, context, restaurant),
                              ),
                      ),
                    ),
        ),
      ),
    );
  }

  AnimationConfiguration itemList(int index, BuildContext context, RestaurantController restaurant) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => DetailRestaurantPage(
                        id: restaurant.restaurantModel.restaurants[index].id,
                        pictureId: restaurant.restaurantModel.restaurants[index].pictureId,
                        name: restaurant.restaurantModel.restaurants[index].name,
                        city: restaurant.restaurantModel.restaurants[index].city,
                      )));
            },
            child: ItemListRestaurant(
              restaurants: restaurant.restaurantModel.restaurants[index],
              idHero: restaurant.restaurantModel.restaurants[index].pictureId,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    var restaurant = Provider.of<RestaurantController>(context, listen: false);

    return Consumer<RestaurantController>(
      builder: (ctx, restaurantData, _) => restaurant.showSearch
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                cursorColor: Theme.of(context).primaryColor,
                controller: _search,
                onChanged: (val) {
                  restaurant.searchRestaurant(val);
                },
                decoration: InputDecoration(
                    hintText: 'cari nama, menu',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _search.clear();
                        restaurant.toggleSearch();
                        restaurant.getRestaurantAll();
                      },
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Image.asset(
                      'assets/logo/logo.png',
                      width: 100,
                      height: 100,
                      color: Colors.transparent.withOpacity(0.1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Restaurant',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text('Recomended Restaurants for you'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                restaurant.toggleSearch();
                              }),
                          IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FavoritePage(),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
