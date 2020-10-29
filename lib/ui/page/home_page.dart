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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => ItemListRestaurant(),
      ),
    );
  }
}
