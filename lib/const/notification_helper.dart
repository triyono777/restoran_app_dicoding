import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:restoran_app_dicoding/controller/db_controller.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:rxdart/subjects.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
      if (payload != null) {}
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, RestaurantModel detailRestaurant) async {
    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "Apps Restaurant channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(_channelId, _channelName, _channelDescription, importance: Importance.Max, priority: Priority.High, ticker: 'ticker', styleInformation: DefaultStyleInformation(true, true));

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    var titleNotification = "<b>Restaurant Promo</b>";
    var titleNews = detailRestaurant.restaurants.toList()..shuffle();

    await flutterLocalNotificationsPlugin.show(0, titleNotification, titleNews[0].name, platformChannelSpecifics, payload: json.encode(detailRestaurant.toJson()));
  }

  void configureSelectNotificationSubject() async {
    var db = await DBController().getAllFavorite();

    selectNotificationSubject.stream.listen(
      (String payload) async {
        var data = RestaurantModel.fromJson(json.decode(payload));
        var restaurant = data.restaurants.toList()..shuffle();

        Get.to(
          DetailRestaurantPage(
            id: restaurant[0].id,
            city: restaurant[0].city,
            pictureId: restaurant[0].pictureId,
            name: restaurant[0].name,
            rating: restaurant[0].rating,
            isFavorite: db.any(
              (element) => element.idRestaurant == restaurant[0].id,
            ),
          ),
        );
      },
    );
  }
}
