import 'dart:async';

import 'package:ampel_lampe_steuerung/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setPrefNewId() async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('webIp', webIpGlobal);
}

Future<void> getPrefId() async{
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString("webIp").toString() != "null") webIpGlobal = prefs.getString('webIp').toString();
}


Future<void> setPrefNewPreset(String preset, double value) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(preset, value);
}

Future<double?> getPrefPreset(String preset) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(preset)?.toDouble();

}