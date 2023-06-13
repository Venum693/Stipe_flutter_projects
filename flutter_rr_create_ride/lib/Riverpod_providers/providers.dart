import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/get_rides_model.dart';
import '../Services_Api/api_repository.dart';

//Global Provider for the API Repository
final ridesProvider = Provider<RideCaptainRepository>((ref) => RidesApi());

final getAllRidesProvider = FutureProvider.autoDispose<RidesList>((ref) async {
  final repository = ref.watch(ridesProvider);
  return repository.getAllRides();
});

//changeNotifier to get store terrain value
class DropDownTerrainNotifier extends ChangeNotifier {
  String _value = "";
  DropDownTerrainNotifier(String initialValue) : _value = initialValue;

  String get postCategory => _value;

  categoryOnChanged(String value) {
    if (value.isEmpty) {
      return _value;
    }
    _value = value;
    print(_value);
    return notifyListeners();
  }
}

class RideStatusNotifier extends ChangeNotifier {

  String _value = "";
  RideStatusNotifier(String initialValue) : _value = initialValue;

  String get postCategory => _value;

  categoryOnChanged(String value) {
    if (value.isEmpty) {
      return _value;
    }
    _value = value;
    print(_value);
    return notifyListeners();
  }
}

class SponsorToggleNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var toggleMode = prefs.getBool("toggleMode");
    state = toggleMode ?? false;
  }

  SponsorToggleNotifier() : super(false) {
    _init();
  }

  void toggle() async {
    state = !state;
    prefs.setBool("toggleMode", state);
  }
}

final sponsorToggleProvider = StateNotifierProvider<SponsorToggleNotifier, bool>(
      (ref) => SponsorToggleNotifier(),
);


