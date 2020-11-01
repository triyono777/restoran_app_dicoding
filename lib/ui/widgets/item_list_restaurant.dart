import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;

class ItemListRestaurant extends StatelessWidget {
  final Restaurants restaurants;
  const ItemListRestaurant({
    Key key,
    this.restaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: restaurants.pictureId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            helper.imageMedium + restaurants.pictureId.toString(),
            fit: BoxFit.cover,
            width: 100,
            height: 150,
          ),
        ),
      ),
      title: Text(
        restaurants.name,
        style: myTextTheme.subtitle1,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItem(iconData: Icons.pin_drop, content: restaurants.city),
          buildItem(iconData: Icons.star, content: restaurants.rating, color: accentColor),
        ],
      ),
      isThreeLine: true,
    );
  }

  Row buildItem({IconData iconData, var content, Color color = Colors.grey}) {
    return Row(
      children: [
        Icon(
          iconData,
          size: myTextTheme.subtitle2.fontSize,
          color: color,
        ),
        Text(
          '$content',
          style: myTextTheme.subtitle2,
        ),
      ],
    );
  }
}
