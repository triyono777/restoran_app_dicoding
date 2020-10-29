import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Restaurant'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) => ItemListRestaurant(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Restaurant',
            style: TextStyle(fontSize: 30),
          ),
          Text('Recomended Restaurants for you'),
        ],
      ),
    );
  }
}
