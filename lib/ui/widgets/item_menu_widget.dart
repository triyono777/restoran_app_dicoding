import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';

class ItemMenuWidget extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  const ItemMenuWidget({
    Key key,
    this.name = 'name',
    this.price = '0',
    this.imageUrl = 'https://via.placeholder.com/150',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://via.placeholder.com/150'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(name),
            Text('Rp.$price'),
          ],
        ),
      ),
    );
  }
}
