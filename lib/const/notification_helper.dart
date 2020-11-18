import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:restoran_app_dicoding/model/detail_restaurant_model.dart';
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
      if (payload != null) {
        print('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, RestaurantModel detailRestaurant) async {
    print(detailRestaurant.restaurants[0].name);

    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "dicoding news channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(_channelId, _channelName, _channelDescription, importance: Importance.Max, priority: Priority.High, ticker: 'ticker', styleInformation: DefaultStyleInformation(true, true));

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    var titleNotification = "<b>Headline News</b>";
    var titleNews = detailRestaurant.restaurants[0].name;

    await flutterLocalNotificationsPlugin.show(0, titleNotification, titleNews, platformChannelSpecifics, payload: json.encode(detailRestaurant.toJson()));
  }

  void configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        var data = RestaurantModel.fromJson(json.decode(payload));
        var restaurant = data.restaurants[0];

        Get.to(
          DetailRestaurantPage(
            id: restaurant.id,
            city: restaurant.city,
            pictureId: restaurant.pictureId,
            name: restaurant.name,
            rating: restaurant.rating,
            isFavorite: false,
          ),
        );
      },
    );
  }
}
