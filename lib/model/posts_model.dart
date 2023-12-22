class Posts{
  final List<dynamic> postsList ;
  Posts({required this.postsList});
  factory Posts.fromJson(List jsonData){
    return Posts(postsList: jsonData);
  }
}