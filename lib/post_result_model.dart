import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;
  PostResult({
    this.created,
    this.id,
    this.job,
    this.name,
  });
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        created: object['createdAt'],
        id: object['id'],
        job: object['job'],
        name: object['name']);
  }
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = 'https://reqres.in/api/users';
    var apiResult = await http.post(
      apiURL,
      body: {
        'name': name,
        'job': job,
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return PostResult.createPostResult(jsonObject);
  }
}
