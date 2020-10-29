import 'package:flutter/material.dart';

class ItemListRestaurant extends StatelessWidget {
  final String name;
  final String city;
  final rating;
  final String pictureId;
  const ItemListRestaurant({
    Key key,
    this.name = 'Name',
    this.city = 'City',
    this.rating = 4,
    this.pictureId = 'https://via.placeholder.com/150',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Image.network(
          pictureId,
          width: 100,
          height: 100,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildItem(iconData: Icons.pin_drop, content: city),
            buildItem(iconData: Icons.star, content: rating),
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
        Text('$rating'),
      ],
    );
  }
}
