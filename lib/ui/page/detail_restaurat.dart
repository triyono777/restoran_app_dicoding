import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';

import 'package:restoran_app_dicoding/ui/widgets/button_fav.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_menu_widget.dart';
import 'package:restoran_app_dicoding/const/const.dart' as helper;
import 'package:restoran_app_dicoding/ui/widgets/template_text_form_field.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/DetailRestaurantPage';
  final String id;
  final String pictureId;
  final String name;
  final String city;
  final rating;
  final bool isFavorite;
  const DetailRestaurantPage({Key key, @required this.id, this.pictureId, this.name, this.city, this.isFavorite, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: FutureBuilder(
        future: Provider.of<RestaurantController>(context, listen: false).getDetailRestaurant(id),
        builder: (ctx, snapshot) => snapshot.hasError
            ? Center(child: Text('terjadi kesalahan load data ${snapshot.error}'))
            : Consumer<RestaurantController>(
                builder: (ctx, detailRest, _) => detailRest?.restaurantModel == null
                    ? Center(
                        child: Lottie.asset(
                          'assets/animation/loading-animation.json',
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          _buildAppBar(detailRest),
                          _buildBody(detailRest, context, scaffoldKey),
                        ],
                      ),
              ),
      ),
    );
  }

  SliverList _buildBody(RestaurantController detailRest, BuildContext context, scaffoldKey) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: myTextTheme.headline5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          size: myTextTheme.subtitle1.fontSize,
                        ),
                        Text(
                          '$city',
                          style: myTextTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    detailRest?.detailRestaurantModel?.restaurant?.description == null
                        ? Center(
                            child: Lottie.asset(
                              'assets/animation/loading-animation.json',
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                '${detailRest.detailRestaurantModel.restaurant.description}',
                                textAlign: TextAlign.justify,
                                style: myTextTheme.bodyText1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildText('Customer Review'),
                                  FlatButton.icon(
                                    icon: Icon(
                                      Icons.add,
                                      color: helper.primaryColor,
                                    ),
                                    onPressed: () {
                                      _addReview(context);
                                    },
                                    label: Text(
                                      'add review',
                                      style: myTextTheme.bodyText1.copyWith(color: helper.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              _buildReview(detailRest, context),
                              SizedBox(
                                height: 20,
                              ),
                              buildText('Foods Menu'),
                              Container(
                                height: 180,
                                child: ListView.builder(
                                  itemCount: detailRest.detailRestaurantModel.restaurant.menus.foods.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) => ItemMenuWidget(
                                    name: detailRest.detailRestaurantModel.restaurant.menus.foods[index].name,
                                  ),
                                ),
                              ),
                              buildText('Drinks Menu '),
                              Container(
                                height: 180,
                                child: ListView.builder(
                                  itemCount: detailRest.detailRestaurantModel.restaurant.menus.drinks.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) => ItemMenuWidget(
                                    name: detailRest.detailRestaurantModel.restaurant.menus.drinks[index].name,
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: Row(
                    children: [
                      TemplateButtonFav(
                        scaffoldKey: scaffoldKey,
                        name: name,
                        rating: rating.toString(),
                        city: city,
                        id: id,
                        pictureId: pictureId,
                        isFav: isFavorite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildDetail(RestaurantController detail, BuildContext context) {
    return detail?.restaurantModel == null
        ? Text('loading')
        : Column(
            children: [
              Text(
                '${detail.detailRestaurantModel.restaurant.description}',
                textAlign: TextAlign.justify,
                style: myTextTheme.bodyText1,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText('Customer Review'),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: helper.primaryColor,
                    ),
                    onPressed: () {
                      _addReview(context);
                    },
                    label: Text(
                      'add review',
                      style: myTextTheme.bodyText1.copyWith(color: helper.primaryColor),
                    ),
                  ),
                ],
              ),
              _buildReview(detail, context),
              SizedBox(
                height: 20,
              ),
              buildText('Foods Menu'),
              Container(
                height: 180,
                child: ListView.builder(
                  itemCount: detail.detailRestaurantModel.restaurant.menus.foods.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(
                    name: detail.detailRestaurantModel.restaurant.menus.foods[index].name,
                  ),
                ),
              ),
              buildText('Drinks Menu '),
              Container(
                height: 180,
                child: ListView.builder(
                  itemCount: detail.detailRestaurantModel.restaurant.menus.drinks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => ItemMenuWidget(
                    name: detail.detailRestaurantModel.restaurant.menus.drinks[index].name,
                  ),
                ),
              ),
            ],
          );
  }

  Container _buildReview(RestaurantController detail, BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: detail.detailRestaurantModel.restaurant.customerReviews?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: helper.secondaryColor.withOpacity(0.3),
            child: LimitedBox(
              maxWidth: MediaQuery.of(context).size.width / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        detail.detailRestaurantModel.restaurant.customerReviews[index].review,
                        style: myTextTheme.bodyText1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildTextReview(detail.detailRestaurantModel.restaurant.customerReviews[index].date),
                        ),
                        _buildTextReview(detail.detailRestaurantModel.restaurant.customerReviews[index].name),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildTextReview(String content) {
    return Text(
      content,
      style: myTextTheme.subtitle2.copyWith(color: Colors.white, fontStyle: FontStyle.italic),
    );
  }

  Text buildText(String label) => Text(
        label,
        style: myTextTheme.headline6,
      );

  SliverAppBar _buildAppBar(RestaurantController detail) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      textTheme: myTextTheme,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        name,
      ),
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: pictureId,
          child: Image.network(helper.imageLarge + pictureId, fit: BoxFit.cover),
        ),
      ),
    );
  }

  _addReview(BuildContext context) async {
    TextEditingController _name = TextEditingController();
    TextEditingController _review = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey();
    showDialog(
      barrierDismissible: false,
      context: context,
      child: AlertDialog(
        title: Text("Add Review"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TemplateTextFormField(
                controller: _name,
                label: 'Nama',
              ),
              TemplateTextFormField(
                controller: _review,
                label: 'Review',
              ),
            ],
          ),
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.grey,
            child: Text(
              'Cancel',
              style: helper.myTextTheme.button.copyWith(color: Colors.white),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Provider.of<RestaurantController>(context, listen: false)
                    .addReview(
                  id: id,
                  name: _name.text,
                  review: _review.text,
                )
                    .then((value) {
                  if (!value) {
                    Navigator.pop(context, true);
                  } else {
                    Navigator.pop(context, false);
                  }
                });
              }
            },
            child: Text(
              'ok',
              style: helper.myTextTheme.button,
            ),
            color: helper.primaryColor,
          ),
        ],
      ),
    );
  }
}
