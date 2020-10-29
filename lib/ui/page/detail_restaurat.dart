import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_menu_widget.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/DetailRestaurantPage';
  final Restaurants restaurant;
  const DetailRestaurantPage({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildAppBar(),
          buildBody(),
        ],
      ),
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${restaurant.name}'),
              Row(
                children: [
                  Icon(Icons.pin_drop),
                  Text('${restaurant.city}'),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('${restaurant.description}'),
              SizedBox(
                height: 50,
              ),
              Text('Foods Menu '),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: restaurant.menus.foods.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(
                    name: restaurant.menus.foods[index].name,
                  ),
                ),
              ),
              Text('Drinks Menu '),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: restaurant.menus.drinks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(
                    name: restaurant.menus.drinks[index].name,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      title: Text(restaurant.name),
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(restaurant.pictureId, fit: BoxFit.cover),
      ),
    );
  }
}
