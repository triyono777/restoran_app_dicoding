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
    return ListTile(
      leading: Hero(
        tag: restaurants.pictureId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            restaurants.pictureId,
            fit: BoxFit.cover,
            width: 100,
            height: 150,
          ),
        ),
      ),
      title: Text(restaurants.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItem(iconData: Icons.pin_drop, content: restaurants.city),
          buildItem(iconData: Icons.star, content: restaurants.rating, color: Colors.orange.shade300),
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
          size: 20,
          color: color,
        ),
        Text('$content'),
      ],
    );
  }
}
