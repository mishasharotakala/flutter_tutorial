import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/app_theme.dart';
import 'package:flutter_tutorial/screens/abc.dart';
import 'package:flutter_tutorial/screens/fun.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('videos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isNotEmpty == true) {
              return SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index){
                      ABCWidget model = ABCWidget.fromJson(
                        snapshot.data.docs[index].data() as Map<String, dynamic>
                      );
                      return Fun(
                        model: model,
                      );
                        //name: snapshot.data?.docs[index]['name'],
                      
                    }),
                  ),
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