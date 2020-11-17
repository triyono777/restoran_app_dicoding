import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/controller/db_controller.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = Provider.of<DBController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: FutureBuilder<List<FavoriteModel>>(
        future: db.getAllFavorite(),
        builder: (ctx, snapshot) => !snapshot.hasData
            ? Center(
                child: Lottie.asset(
                  'assets/animation/loading-animation.json',
                ),
              )
            : (db.listFavorites.isEmpty
                ? Center(child: Text('Belum ada favorite '))
                : Consumer<DBController>(
                    builder: (context, dbRest, _) => ListView.builder(
                      itemCount: dbRest.listFavorites.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => DetailRestaurantPage(
                                    id: dbRest.listFavorites[index].idRestaurant,
                                    pictureId: dbRest.listFavorites[index].idPicture,
                                    name: dbRest.listFavorites[index].name,
                                    city: dbRest.listFavorites[index].city,
                                  )));
                        },
                        child: ItemListRestaurant(
                          city: dbRest.listFavorites[index].city,
                          rating: dbRest.listFavorites[index].rating,
                          name: dbRest.listFavorites[index].name,
                          idPicture: dbRest.listFavorites[index].idPicture,
                        ),
                      ),
                    ),
                  )),
      ),
    );
  }
}
