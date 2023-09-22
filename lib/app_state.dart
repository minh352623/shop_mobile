import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<dynamic> _listSlider = [];
  List<dynamic> get listSlider => _listSlider;
  set listSlider(List<dynamic> _value) {
    _listSlider = _value;
  }

  void addToListSlider(dynamic _value) {
    _listSlider.add(_value);
  }

  void removeFromListSlider(dynamic _value) {
    _listSlider.remove(_value);
  }

  void removeAtIndexFromListSlider(int _index) {
    _listSlider.removeAt(_index);
  }

  void updateListSliderAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listSlider[_index] = updateFn(_listSlider[_index]);
  }

  void insertAtIndexInListSlider(int _index, dynamic _value) {
    _listSlider.insert(_index, _value);
  }

  String _accessToken = '895|co7Z5KyXGJ9gk3Kcvph9gOdr6D5crWFR79S06wr0';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
  }

  List<dynamic> _ListPartner = [];
  List<dynamic> get ListPartner => _ListPartner;
  set ListPartner(List<dynamic> _value) {
    _ListPartner = _value;
  }

  void addToListPartner(dynamic _value) {
    _ListPartner.add(_value);
  }

  void removeFromListPartner(dynamic _value) {
    _ListPartner.remove(_value);
  }

  void removeAtIndexFromListPartner(int _index) {
    _ListPartner.removeAt(_index);
  }

  void updateListPartnerAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _ListPartner[_index] = updateFn(_ListPartner[_index]);
  }

  void insertAtIndexInListPartner(int _index, dynamic _value) {
    _ListPartner.insert(_index, _value);
  }

  List<dynamic> _AllProduct = [];
  List<dynamic> get AllProduct => _AllProduct;
  set AllProduct(List<dynamic> _value) {
    _AllProduct = _value;
  }

  void addToAllProduct(dynamic _value) {
    _AllProduct.add(_value);
  }

  void removeFromAllProduct(dynamic _value) {
    _AllProduct.remove(_value);
  }

  void removeAtIndexFromAllProduct(int _index) {
    _AllProduct.removeAt(_index);
  }

  void updateAllProductAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _AllProduct[_index] = updateFn(_AllProduct[_index]);
  }

  void insertAtIndexInAllProduct(int _index, dynamic _value) {
    _AllProduct.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
