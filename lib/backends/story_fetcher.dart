import 'package:facebook/backends/models.dart';

// getting stories here

List<Story> getStory() {
  List<Story> stories = [];
  Story storyObj;

  for (var index = 0; index <= 9; index++) {
    storyObj = index % 2 == 0
        ? Story(
            isViewed: true,
            userImg: './assets/img${index + 1}.jpg',
            userName: 'User $index')
        : Story(
            isViewed: false,
            userImg: './assets/img${index + 1}.jpg',
            userName: 'User $index');

    stories.add(storyObj);
  }
  return stories;
}

String getCurentUser() {
  final String currentUser = './assets/currentUser.jpg';
  return currentUser;
}
