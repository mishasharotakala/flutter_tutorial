import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/custom_video_player.dart';
import 'package:flutter_tutorial/screens/post_model.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Post> posts = Post.posts;
    return Scaffold(
      appBar: const  _CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: posts.map((post) {
            return CustomVideoPlayer(post: post);
          }).toList(),
        ),
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(context, 'For You'),
          _buildButton(context, 'Following'),
        ],
      ),
    );
  }

  TextButton _buildButton(BuildContext context, String text) {
    return TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            fixedSize: const Size(100, 50),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
  }
  
  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
  }