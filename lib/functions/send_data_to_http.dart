import 'package:ampel_lampe_steuerung/variables.dart';
import 'package:http/http.dart' as http;



Future<http.Response> fetchAlbum(String data) {
  var encoded = Uri.encodeFull(data);
  print("Encoded: " + encoded);
  return http.get(Uri.parse(encoded));
}