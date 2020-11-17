import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/controller/db_controller.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';

class TemplateButtonFav extends StatefulWidget {
  final bool isFav;
  final String id;
  final String pictureId;
  final String name;
  final String city;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final rating;
  const TemplateButtonFav({
    Key key,
    this.isFav,
    this.id,
    this.pictureId,
    this.name,
    this.city,
    this.rating,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  _TemplateButtonFavState createState() => _TemplateButtonFavState();
}

class _TemplateButtonFavState extends State<TemplateButtonFav> {
  bool fav = false;

  Future<bool> setFav() async {
    setState(() {
      fav = !fav;
    });
    return fav;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fav = widget.isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<DBController>(context, listen: false);
    return IconButton(
      icon: Icon(
        fav ? Icons.favorite : Icons.favorite_border,
        size: 40,
        color: primaryColor,
      ),
      onPressed: () async {
        widget.scaffoldKey.currentState.hideCurrentSnackBar();
        setFav().then((value) {
          if (value == false) {
            db.deleteFavorite(
              idFav: widget.id,
            );

            buildSnackBar('Hapus');
          }
          if (value == true) {
            db.addFavorite(
              favorite: FavoriteModel(
                idRestaurant: widget.id,
                city: widget.city,
                name: widget.name,
                idPicture: widget.pictureId,
                rating: widget.rating.toString(),
              ),
            );

            buildSnackBar('Simpan');
          }
        });
      },
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackBar(String label) {
    return widget.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$label favorite sukses'),
      backgroundColor: primaryColor.withOpacity(0.9),
    ));
  }
}
