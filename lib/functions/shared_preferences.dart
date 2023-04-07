import 'package:ampel_lampe_steuerung/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setPrefNew() async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('webIp', webIpGlobal);
}

Future<void> getPref() async{
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString("webIp").toString() != "null") webIpGlobal = prefs.getString('webIp').toString();
}