import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_three/models/user_model.dart';
import '../models/image_model.dart';


class DetailsRequest {
  static var apiUrlInfo = (int personId) => Uri.parse("https://api.themoviedb.org/3/person/$personId?api_key=2dfe23358236069710a379edd4c65a6b");
  static var apiUrlImages = (int personId) => Uri.parse("https://api.themoviedb.org/3/person/$personId/images?api_key=2dfe23358236069710a379edd4c65a6b");

  static var headers = { "content-type": "application/json" };


  Future<UserModel ?> getUserDetails(int personId) async {
    var response = await http.get(apiUrlInfo(personId), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = {};
      jsonResponse = json.decode(response.body);
      return UserModel.fromJson(jsonResponse);
    } else {
      return null;
    }
  }


  Future<List<ImageModel>?> getUserImages(int personId) async {
    var response = await http.get(apiUrlImages(personId), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = {};
      jsonResponse = json.decode(response.body);
      List<dynamic> imageList = jsonResponse['profiles'];
      return imageList.map((image) => ImageModel.fromJson(image)).toList();
    } else {
      return null;
    }
  }
}