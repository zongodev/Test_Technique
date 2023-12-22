class Post {
  final String title , body ;
  final int? id,userId;
  Post({required this.title, required this.body, required this.id, required this.userId});

  factory Post.fromJson(Map<String , dynamic> jsonData) {
    return Post(title: jsonData["title"], body: jsonData["body"], id: jsonData["id"], userId: jsonData["userId"]);
  }
}