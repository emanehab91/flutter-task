import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/home_model.dart';

class HomeRequest {
  static var apiUrl = Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b");
static var headers ={ "content-type":"application/json"};
  Future<HomeModel?> getHomeData() async {
    var response = await http.get(apiUrl, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = {};
      jsonResponse = json.decode(response.body);
      HomeModel homedata = HomeModel();
      return HomeModel.fromJson(jsonResponse);
    }
    else
      return null;
  }}