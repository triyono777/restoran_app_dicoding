import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/const/date_time_helper.dart';
import 'package:restoran_app_dicoding/controller/background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledRestaurant(bool value) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _isScheduled = value;
    if (_isScheduled) {
      print('Scheduling Restaurant Activated');
      _sharedPreferences.setBool('daily', _isScheduled);
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling Restaurant Canceled');
      _sharedPreferences.setBool('daily', _isScheduled);
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
