import 'package:flutter/material.dart';

class DabWidget extends StatefulWidget{
  final String image;
  final String name;
  

  const DabWidget({super.key, 
    required this.image,
    required this.name,
  });

  @override 
  State<DabWidget> createState() => _DabWidget();
}

class _DabWidget extends State<DabWidget> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        //alignment: Alignment.bottomRight,
        height: MediaQuery.of(context).size.height,
        child: Material(
          color: const Color.fromARGB(255, 220, 135, 164),
          elevation: 8,
          borderRadius: BorderRadius.circular(48),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.grey.shade500,
            onTap: () {},
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Ink.image(
                      image: NetworkImage(
                        widget.image,
                      ),
                      /*height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,*/
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                  selectionColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );


    /*return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        image: DecorationImage(
          image: NetworkImage(
            widget.url,
          
          ),
          fit: BoxFit.fill,
        ),
      ),

      child: Text(
        widget.label,
        style: AppTheme.darkTextTheme.bodyText1,
      ),
      
    );*/

    /*return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(
                  widget.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
            //child: Image.network(widget.image),),
        ),
        //const SizedBox(height: 10,),

          Text(
            widget.names,
            style: AppTheme.darkTextTheme.bodyText1,
            /*style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),*/
          ),
        ],
      ),
    ); */
    
  }
}