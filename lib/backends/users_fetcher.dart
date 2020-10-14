// getting all users

import 'package:facebook/backends/models.dart';

List<User> getUsers() {
  List<User> users = [];
  User userObj;

  int index = 0;

  for (index = 0; index <= 9; index++) {
    userObj = index % 2 == 0
        ? User(userImg: './assets/img${index + 1}.jpg', userIsOnline: true)
        : User(userImg: './assets/img${index + 1}.jpg', userIsOnline: false);

    users.add(userObj);
  }
  return users;
}

String loggedInUserImg() {
  return './assets/currentUser.jpg';
}
