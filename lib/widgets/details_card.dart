import 'package:flutter/material.dart';
import 'package:test_technique/model/post_model.dart';
class DetailsCard extends StatelessWidget {
  final Post post;

  const DetailsCard({Key? key, required this.post}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  post.id.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              post.title,
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              post.body,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "User: ${post.userId}",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
