import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/widgets/item_list_restaurant.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              child: RefreshIndicator(
                onRefresh: () async {
                  RestaurantController().getRestaurant();
                },
                child: FutureBuilder<RestaurantModel>(
                  future: RestaurantController().getRestaurant(),
                  builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: Lottie.asset(
                            'assets/animation/loading-animation.json',
                          ),
                        )
                      : snapshot.hasError
                          ? Text('terjadi kesalahan load data ${snapshot.error}')
                          : AnimationLimiter(
                              child: ListView.builder(
                                itemCount: snapshot.data.count,
                                itemBuilder: (ctx, index) => AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            DetailRestaurantPage.routeName,
                                            arguments: snapshot.data.restaurants[index],
                                          );
                                        },
                                        child: ItemListRestaurant(
                                          restaurants: snapshot.data.restaurants[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            right: -100,
            top: 5,
            child: Image.asset(
              'assets/logo/logo.png',
              width: 100,
              height: 100,
              color: Colors.transparent.withOpacity(0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant',
                style: TextStyle(fontSize: 30),
              ),
              Text('Recomended Restaurants for you'),
            ],
          ),
        ],
      ),
    );
  }
}
