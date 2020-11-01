import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_menu_widget.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/DetailRestaurantPage';
  final Restaurants restaurant;
  const DetailRestaurantPage({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<RestaurantController>(context, listen: false).getDetailRestaurant(restaurant.id),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: Lottie.asset(
                  'assets/animation/loading-animation.json',
                ),
              )
            : snapshot.hasError
                ? Center(child: Text('terjadi kesalahan load data ${snapshot.error}'))
                : Consumer<RestaurantController>(
                    builder: (ctx, detailRest, _) => CustomScrollView(
                      slivers: [
                        _buildAppBar(detailRest),
                        _buildBody(detailRest),
                      ],
                    ),
                  ),
      ),
    );
  }

  SliverList _buildBody(RestaurantController detail) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${detail.detailRestaurantModel.restaurant.name}',
                  style: myTextTheme.headline5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: myTextTheme.subtitle1.fontSize,
                    ),
                    Text(
                      '${detail.detailRestaurantModel.restaurant.city}',
                      style: myTextTheme.subtitle1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${detail.detailRestaurantModel.restaurant.description}',
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
                    itemCount: detail.detailRestaurantModel.restaurant.menus.foods.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => ItemMenuWidget(
                      name: detail.detailRestaurantModel.restaurant.menus.foods[index].name,
                    ),
                  ),
                ),
                buildText('Drinks Menu '),
                Container(
                  height: 180,
                  child: ListView.builder(
                    itemCount: detail.detailRestaurantModel.restaurant.menus.drinks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => ItemMenuWidget(
                      name: detail.detailRestaurantModel.restaurant.menus.drinks[index].name,
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

  SliverAppBar _buildAppBar(RestaurantController detail) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      textTheme: myTextTheme,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        detail.detailRestaurantModel.restaurant.name,
      ),
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: detail.detailRestaurantModel.restaurant.pictureId,
          child: Image.network(helper.imageLarge + detail.detailRestaurantModel.restaurant.pictureId, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
