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
                : ListView.builder(
                    itemCount: db.listFavorites.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailRestaurantPage(
                                  id: db.listFavorites[index].idRestaurant,
                                  pictureId: db.listFavorites[index].idPicture,
                                  name: db.listFavorites[index].name,
                                  city: db.listFavorites[index].city,
                                )));
                      },
                      child: ItemListRestaurant(
                        city: db.listFavorites[index].city,
                        rating: db.listFavorites[index].rating,
                        name: db.listFavorites[index].name,
                        idPicture: db.listFavorites[index].idPicture,
                      ),
                    ),
                  )),
      ),
    );
  }
}
