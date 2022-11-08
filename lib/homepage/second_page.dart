import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tutorial/homepage/dab.dart';
import 'package:flutter_tutorial/homepage/design.dart';
import 'package:flutter_tutorial/homepage/first_widget.dart';
import 'package:flutter_tutorial/homepage/second_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hello',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('carousel_slider').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.data?.docs.isNotEmpty == true) {
                        return CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 16/9,
                            enlargeCenterPage: true,
                            height: MediaQuery.of(context).size.height * 0.9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            reverse: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(seconds: 5),
                            autoPlayCurve: Curves.fastOutSlowIn,
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
              ),
            ),
            const SizedBox(height: 10,),

            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('alicia').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.data?.docs.isNotEmpty == true) {
                        return GridView.builder(
                          itemCount: snapshot.data?.docs.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index){
                            return FirstWidget(
                              image: snapshot.data?.docs[index]['image'], 
                              name: snapshot.data?.docs[index]['name'],
                            );
                          },
                        );
                      }
                      else{
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: Text("Nothing"),
                          ),
                        );
                      }
                    }
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "Something went wrong",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),


            /*StreamBuilder(
              stream: FirebaseFirestore.instance.collection('alicia').snapshots(),
              builder: (context, AsyncSnapshot dataSnapshot) {
                if(dataSnapshot.hasData) {
                  return SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      staggeredTileBuilder: (c) => const StaggeredTile.fit(2),
                      itemBuilder: (context, index) {
                        SecondWidget model = SecondWidget.fromJson(
                          dataSnapshot.data.docs[index].data as Map<String, dynamic>
                        );
                        return DesignWidget(
                          model: model,
                        );
                      },
                      itemCount: dataSnapshot.data.docs.length
                    
                  );
                }
                else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Nothing',
                      ),
                    ),
                  );
                }
              }
            ),*/
          ],
        ),
      ),
    );
  }
}