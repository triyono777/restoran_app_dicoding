import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_menu_widget.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const routeName = '/DetailRestaurantPage';
  final RestaurantModel restaurantModel;
  final int index;

  const DetailRestaurantPage({Key key, this.restaurantModel, this.index}) : super(key: key);
  @override
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: ListView(
        children: [
          Image.network('https://via.placeholder.com/150'),
//          Image.network(widget.restaurantModel.restaurants[widget.index].pictureId),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurant'),
              Text('Restaurant'),
              SizedBox(
                height: 50,
              ),
              Text('Restaurant'),
              SizedBox(
                height: 50,
              ),
              Text('Foods Menu '),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(),
                ),
              ),
              Text('Drinks Menu '),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
