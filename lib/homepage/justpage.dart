import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/app_theme.dart';
import 'package:flutter_tutorial/homepage/first_widget.dart';

class JustPage extends StatefulWidget {
  const JustPage({super.key});

  @override
  State<JustPage> createState() => _JustPageState();
}

class _JustPageState extends State<JustPage> {

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

  final PageController controller = PageController();
  //final CarouselController controller = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('carousel_slider').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isNotEmpty == true) {
              return Column(
                children: [
                  ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index){
                      return FirstWidget(
                        image: snapshot.data?.docs[index]['image'], 
                        name: snapshot.data?.docs[index]['name'],
                      );
                    }),
                  ),
                  /*const SizedBox(height: 5,),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex, 
                    count: snapshot.data?.docs.length,
                    effect: JumpingDotEffect(),
                  ),*/
                  
                  
                  /*Flexible(
                    child: GridView.builder(
                      itemCount: snapshot.data?.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: CarouselWidget(
                          imageUrl: snapshot.data?.docs[index]['imageUrl'], 
                          names: snapshot.data?.docs[index]['names'],
                        ),
                      );
                    },
                  ),
                  ),*/
                ],
              );
            }
            else{
              return const Center(
                child: Text("Nothing"),
              );
            }
          }
          return const Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          );
        }
      ),
    );
  }
}