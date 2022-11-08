import 'package:flutter/material.dart';
import 'package:flutter_tutorial/homepage/firstpage.dart';
import 'package:flutter_tutorial/homepage/grid.dart';
import 'package:flutter_tutorial/homepage/justpage.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {

  /*List<Widget> generateImageTiles(screenSize) {
    return imageUrl
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  } */

  //final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Flexible(
            child: FirstPage(),
          ),
          const SizedBox(height: 10,),
          const Flexible(
            child: JustPage(),
          ),
          const SizedBox(height: 1,),
          const Flexible(
            child: Grid(),
          ),
        ],
      ),
    );  
  }
}