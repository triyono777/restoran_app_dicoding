import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';

class ItemListRestaurant extends StatelessWidget {
  final Restaurants restaurants;
  const ItemListRestaurant({
    Key key,
    this.restaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Hero(
          tag: restaurants.pictureId,
          child: Image.network(
            restaurants.pictureId,
            width: 100,
            height: 100,
          ),
        ),
        title: Text(restaurants.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildItem(iconData: Icons.pin_drop, content: restaurants.city),
            buildItem(iconData: Icons.star, content: restaurants.rating),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Row buildItem({IconData iconData, var content}) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 20,
        ),
        Text('$content'),
      ],
    );
  }
}
