import 'dart:convert';
import 'package:http/http.dart';
import 'package:pattern_mobx/models/post_model.dart';

class HttpService {

  // Base url
  static String BASE_URL = "624b329071e21eebbceebff9.mockapi.io";

  // Header 624b329071e21eebbceebff9.mockapi.io/mock/pattern

  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Apis
  static String API_USERS = "/mock/pattern";
  static String API_POST = "/mock/pattern";

  static String apiDelete(String userId) {
    return "/mock/pattern/$userId";
  }

  static String apiPatch(String userId) {
    return "/mock/pattern/$userId";
  }

  // Methods

  // get method
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await get(uri, headers: headers);
    print("\nResponse => ${response.body}");
    print("\nUrl => $uri \n");
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // post method
  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await post(
        uri, headers: headers, body: jsonEncode(params));
    print("Post create => ${response.body}");
    if (response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // put method
  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api);
    print("\nUrl => $uri \n");
    Response response = await put(
        uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // delete method
  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Params
  static Map<String, dynamic> paramEmpty() {
    Map<String, dynamic> map = {};
    return map;
  }

  static Map<String, dynamic> paramsCreate(Post post) {
    Map<String, dynamic> map = {
      'name' : post.name,
      'title': post.title,
      'body': post.body,
      'dateTime': post.dateTime,
    };
    return map;
  }

  /* Http parsing */

  static List<Post> parsePatternApi(String body) {
    List<Post> list = postFromJson(body);
    return list;
  }
}