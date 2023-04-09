import 'package:ampel_lampe_steuerung/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> sendData(String data) {
  return http.post(Uri.parse(webIpGlobal),
      headers: <String, String> {
        'Content-Type' : 'application/json; charset=UTF-8'
     },
    body: jsonEncode(<String, String> {
      'title' : data,
    })
  );
}