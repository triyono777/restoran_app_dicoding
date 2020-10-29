import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/const.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${restaurant.name}',
                  style: myTextTheme.headline5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: myTextTheme.subtitle1.fontSize,
                    ),
                    Text(
                      '${restaurant.city}',
                      style: myTextTheme.subtitle1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${restaurant.description}',
                  textAlign: TextAlign.justify,
                  style: myTextTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                buildText('Foods Menu'),
                Container(
                  height: 180,
                  child: ListView.builder(
                    itemCount: restaurant.menus.foods.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => ItemMenuWidget(
                      name: restaurant.menus.foods[index].name,
                    ),
                  ),
                ),
                buildText('Drinks Menu '),
                Container(
                  height: 180,
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
          ),
        ],
      ),
    );
  }

  Text buildText(String label) => Text(
        label,
        style: myTextTheme.headline6,
      );

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      backgroundColor: primaryColor,
      textTheme: myTextTheme,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        restaurant.name,
      ),
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: restaurant.pictureId,
          child: Image.network(restaurant.pictureId, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
