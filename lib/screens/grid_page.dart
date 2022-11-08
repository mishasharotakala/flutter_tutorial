import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/abc.dart';
import 'package:flutter_tutorial/screens/fun.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('videos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isNotEmpty == true) {
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data?.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        ABCWidget model = ABCWidget.fromJson(
                        snapshot.data.docs[index].data() as Map<String, dynamic>
                      );
                      return Fun(
                        model: model,
                      );
                      },
                    ),
                  ),
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