import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_technique/services/api_service.dart';
import 'package:test_technique/widgets/details_card.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text(
          "Post Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.details, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: ApiService.fetchPostById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "${snapshot.error}",
                  ),
                );
              } else {
                var post = snapshot.data!;
                return DetailsCard(post: post);
              }
            },
          ),
        ],
      ),
    );
  }
}
