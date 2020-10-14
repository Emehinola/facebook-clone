import 'package:facebook/backends/models.dart';

// getting posts here

List<Post> getPost() {
  final List<Post> posts = [];
  Post postObj;

  for (var index = 0; index <= 9; index++) {
    postObj = Post(
        post: "Hello world. This is the post number ${index + 1}",
        comments: 10 * index,
        likes: 5 * index,
        time: 'Just now',
        userImg: './assets/img${index + 1}.jpg',
        userName: 'Emehinola Samuel ${index + 1}');

    posts.add(postObj);
  }

  return posts;
}
