import 'package:get/get.dart';
import 'package:test_technique/model/post_model.dart';
import 'package:test_technique/services/api_service.dart';

class PostsController extends GetxController{

  RxList postList =[].obs;
  void fetchPosts() async {
    postList.value = await ApiService.fetchPostsData();
  }
  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }
}