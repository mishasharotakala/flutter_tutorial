import 'package:flutter/material.dart';
import 'package:flutter_tutorial/homepage/second_widget.dart';

class DesignWidget extends StatefulWidget {
  
  SecondWidget? model;

  DesignWidget({Key? key, this.model}) : super(key: key);

  @override 
  State<DesignWidget> createState() => _DesignWidgetState();
}

class _DesignWidgetState extends State<DesignWidget> {
  @override 
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      elevation: 20,
      shadowColor: Colors.grey,
      child: SizedBox(
        height: 270,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                widget.model!.image.toString(),
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 1,),
            Text(
              widget.model!.name.toString(),
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}