import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantModel restaurantModel;

  @override
  void initState() {
    super.initState();
    RestaurantController().getRestaurant(context).then(
          (value) => setState(() {
            restaurantModel = value;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Restaurant'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          Expanded(
            child: restaurantModel == null
                ? Center(child: Text('data tidak ada'))
                : ListView.builder(
                    itemCount: restaurantModel?.restaurants?.length ?? 0,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(DetailRestaurantPage.routeName);
                      },
                      child: ItemListRestaurant(
                        name: restaurantModel.restaurants[index].name,
                        city: restaurantModel.restaurants[index].city,
                        pictureId: restaurantModel.restaurants[index].pictureId,
                        rating: restaurantModel.restaurants[index].rating,
                      ),
                    ),
                  ),
          ),
        ],
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
