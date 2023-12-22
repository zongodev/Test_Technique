import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_technique/model/post_model.dart';
import 'package:test_technique/model/posts_model.dart';
class ApiService {

   static Future<List<Post>> fetchPostsData() async {
      try {
         var response = await http.get(
             Uri.parse("https://jsonplaceholder.typicode.com/posts"));
         if (response.statusCode == 200) {
            var jsonData = jsonDecode(response.body);
            Posts posts = Posts.fromJson(jsonData);
            final List<Post> postsList = posts.postsList.map((e) => Post.fromJson(e))
                .toList();
            return postsList;
         }else{
            log("Status code = ${response.statusCode}");
         }
      }catch (e){
         log(e.toString());
      }
      throw Exception("error");
   }

   static Future<Post> fetchPostById(int id) async {
      try {
         var response = await http.get(
             Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
         if (response.statusCode == 200) {
            var jsonData = jsonDecode(response.body);
            Post post = Post.fromJson(jsonData);
            return post;
         }else{
            log("Status code = ${response.statusCode}");
         }
      }catch (e){
         log(e.toString());
      }
      throw Exception("error");
   }


}