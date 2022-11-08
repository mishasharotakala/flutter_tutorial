import 'package:flutter_tutorial/screens/user_model.dart';

enum PostType {image, video, audio}

class Post{
  final String id;
  final User user;
  final PostType type;
  final String caption;
  final String assetPath;

  Post({
    required this.id,
    required this.user,
    required this.type,
    required this.caption,
    required this.assetPath,
  });

  static List<Post> posts = [
    Post(
      id: '1',
      user: User.users[0],
      type: PostType.video,
      caption: "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
      assetPath: 'assets/videos/a.mp4',
    ),

    Post(
      id: '2',
      user: User.users[2],
      type: PostType.video,
      caption: "You told your friends you want me dead And said that I did everything wrong And you're not wrong Well, I'll take all the vitriol But not the thought of you moving on",
      assetPath: 'assets/videos/abc.mp4',
    ),

    Post(
      id: '3',
      user: User.users[1],
      type: PostType.video,
      caption: "'Cause I'm not ready To find out you know how to forget me I'd rather hear how much you regret me And pray to God that you never met me Than forget me",
      assetPath: 'assets/videos/c.mp4',
    ),

    Post(
      id: '4',
      user: User.users[0],
      type: PostType.video,
      caption: "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
      assetPath: 'assets/videos/d.mp4',
    ),

    Post(
      id: '5',
      user: User.users[3],
      type: PostType.video,
      caption: "Oh, I hate to know I made you cry But love to know I cross your mind, baby, oh oh Even after all, it still wrecks me To find out you knew how to forget me Even after all this time",
      assetPath: 'assets/videos/e.mp4',
    ),

    Post(
      id: '6',
      user: User.users[0],
      type: PostType.video,
      caption: "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
      assetPath: 'assets/videos/f.mp4',
    ),

    Post(
      id: '7',
      user: User.users[0],
      type: PostType.video,
      caption: "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
      assetPath: 'assets/videos/g.mp4',
    ),

    Post(
      id: '8',
      user: User.users[0],
      type: PostType.video,
      caption: "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
      assetPath: 'assets/videos/h.mp4',
    ),

    Post(
      id: '9',
      user: User.users[3],
      type: PostType.video,
      caption: "Oh, I hate to know I made you cry But love to know I cross your mind, baby, oh oh Even after all, it still wrecks me To find out you knew how to forget me Even after all this time",
      assetPath: 'assets/videos/i.mp4',
    ),

    Post(
      id: '10',
      user: User.users[1],
      type: PostType.video,
      caption: "'Cause I'm not ready To find out you know how to forget me I'd rather hear how much you regret me And pray to God that you never met me Than forget me",
      assetPath: 'assets/videos/j.mp4',
    ),
  ];
}