import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/config/config.dart';
import 'package:test_app/data/models/post_model.dart';

class PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSource(this.client);

  Future<List<PostModel>> getPosts() async {
    final response =
        await client.get(Uri.parse('${Config.jsonplaceholderApiUrl}/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<PostModel> getPostById(int id) async {
    final response = await client
        .get(Uri.parse('${Config.jsonplaceholderApiUrl}/posts/$id'));

    if (response.statusCode == 200) {
      final dynamic jsonResult = json.decode(response.body);
      return PostModel.fromJson(jsonResult);
    } else {
      throw Exception('Failed to load post by id');
    }
  }
}
