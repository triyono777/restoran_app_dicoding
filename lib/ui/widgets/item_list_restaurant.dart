import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;

class ItemListRestaurant extends StatelessWidget {
  final String idPicture;
  final String name;
  final String city;
  final rating;
  const ItemListRestaurant({
    Key key,
    this.idPicture,
    this.name,
    this.city,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: idPicture,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            helper.imageMedium + idPicture.toString(),
            fit: BoxFit.cover,
            width: 100,
            height: 150,
          ),
        ),
      ),
      title: Text(
        name,
        style: myTextTheme.subtitle1,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItem(iconData: Icons.pin_drop, content: city),
          buildItem(iconData: Icons.star, content: rating, color: accentColor),
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
