import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestaurantModel> future;
  TextEditingController search;
  @override
  void initState() {
    super.initState();
    future = RestaurantController().getRestaurant(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            Expanded(
              child: FutureBuilder<RestaurantModel>(
                future: future,
                builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : snapshot.hasError
                        ? Text('terjadi kesalahan load data')
                        : ListView.builder(
                            itemCount: snapshot.data.restaurants.length,
                            itemBuilder: (ctx, index) => snapshot.data.restaurants[index].name.contains(search.text)
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        DetailRestaurantPage.routeName,
                                        arguments: snapshot.data.restaurants[index],
                                      );
                                    },
                                    child: ItemListRestaurant(
                                      restaurants: snapshot.data.restaurants[index],
                                    ),
                                  )
                                : Container(),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
//          Column(
////            crossAxisAlignment: CrossAxisAlignment.start,
////            children: [
////              Text(
////                'Restaurant',
////                style: TextStyle(fontSize: 30),
////              ),
////              Text('Recomended Restaurants for you'),
////            ],
////          ),

          Expanded(
            child: TextField(
              controller: search,
              decoration: InputDecoration(
                hintText: 'Search Restaurant',
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  future.then((value) => value.restaurants.where((element) => element.name == search.text).toList());
                  print('oke');
                });
              }),
        ],
      ),
    );
  }
}
