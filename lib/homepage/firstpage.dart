import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/app_theme.dart';
import 'package:flutter_tutorial/homepage/first_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

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
  final CarouselController controller = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hi, Welcome to our shop',
          style: AppTheme.darkTextTheme.bodyText2,
        ),
      ),
      resizeToAvoidBottomInset: false,
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
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 25/16,
                      enlargeCenterPage: true,
                      height: MediaQuery.of(context).size.height * 0.30,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      //onPageChanged: (index, reason) => 
                      //setState(() => activeIndex = index),
                      scrollDirection: Axis.horizontal,
                    ),
                    carouselController: controller,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index, realIndex){
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