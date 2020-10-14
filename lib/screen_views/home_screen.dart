// the home page

import 'package:facebook/backends/story_fetcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/backends/models.dart';
import 'package:facebook/custom_widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook/config/palette.dart';

class Home extends StatefulWidget {
  // progress loading
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<User> _users = getUsers();

  final String currentUser = loggedInUserImg();

  final List<Story> _stories = getStory();
  final List<Post> _posts = getPost();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfileAvatar(
                    userImg: currentUser,
                    userIsOnline:
                        true), // profile avatar class defines the circle image profile
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () {
                      print('live pressed');
                    },
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.red,
                    ),
                    label: Text('Live'),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      print('photo pressed');
                    },
                    icon: Icon(Icons.photo_album, color: Colors.green),
                    label: Text('Photo'),
                  ),
                  VerticalDivider(color: Colors.grey),
                  FlatButton.icon(
                      onPressed: () {
                        print('Room pressed');
                      },
                      icon: Icon(Icons.videocam, color: Colors.purpleAccent),
                      label: Text('Room'))
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),

      // rooms container here
      Container(
        color: Colors.white,
        height: 60,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _users.length + 1,
          itemBuilder: (context, index) {
            return index != 0
                ? Container(
                    margin: EdgeInsets.only(left: 8),
                    child: ProfileAvatar(
                        userImg: _users[index - 1].userImg,
                        userIsOnline: _users[index - 1].userIsOnline))
                : Container(
                    margin: EdgeInsets.only(left: 8),
                    child: RoomBtn(onPressed: () {
                      print('Create room pressed');
                    }));
          },
        ),
      ),
      SizedBox(height: 10),

      // stories container here
      Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          color: Colors.white,
          height: 210,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length + 1,
              itemBuilder: (context, index) {
                return index != 0
                    ? StoryDesign(
                        isViewed: _stories[index - 1].isViewed,
                        img: _stories[index - 1].userImg,
                        story: _stories[index - 1].userImg,
                        userName: _stories[index - 1].userName,
                      )
                    : AddToStory(
                        isViewed: false,
                        img: currentUser,
                        story: currentUser,
                        userName: 'Add To Story',
                      );
              })),
      SizedBox(
        height: 10,
      ),

      // listing posts
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('${_posts[index].userImg}')),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${_posts[index].userName}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Row(
                                  children: [
                                    Text('${_posts[index].time} * ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                    Icon(Icons.public,
                                        size: 15, color: Colors.grey),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {
                                print('more pressed');
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '${_posts[index].post}',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('./assets/img${index + 1}.jpg',
                        height: 270, fit: BoxFit.cover),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Palette.facebookBlue,
                                        borderRadius:
                                            BorderRadius.circular(600)),
                                    child: Icon(MdiIcons.thumbUp,
                                        size: 15, color: Colors.white),
                                  ),
                                  Icon(MdiIcons.react)
                                ],
                              ),
                              flex: 3),
                          Expanded(
                              child: Text('${_posts[index].comments} Comments',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              flex: 1),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReactionBtn(
                          icon: MdiIcons.thumbUpOutline,
                          onPressed: () {
                            print('like');
                          },
                          text: 'Like',
                        ),
                        ReactionBtn(
                          icon: MdiIcons.commentOutline,
                          onPressed: () {
                            print('comment');
                          },
                          text: 'Comment',
                        ),
                        ReactionBtn(
                          icon: MdiIcons.shareOutline,
                          onPressed: () {
                            print('share');
                          },
                          text: 'Share',
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      )
    ]);
  }
}
