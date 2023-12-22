import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_technique/controller/postscontroller.dart';
import 'package:test_technique/services/api_service.dart';
import 'package:test_technique/view/detailspage.dart';

import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PostsController postsController = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "All Posts",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.art_track,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Obx(
        () {
          return postsController.postList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.indigo,
                ),)
              : RefreshIndicator(
                onRefresh: () async {
                  postsController.postList.clear();
                  await Future.delayed(const Duration(seconds: 2));
                  return postsController.fetchPosts();
                },
                child: ListView.builder(
                    itemCount: postsController.postList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed("/details",
                              arguments:
                                  postsController.postList.value[index].id);
                        },
                        child: PostCard(
                          postsController: postsController,
                          index: index,
                        ),
                      );
                    },
                  ),
              );
        },
      ),
    );
  }
}
