import 'package:flutter/material.dart';
import '../models/noticias.dart';
import '../page_transitions.dart';
import '../screens/home.dart';
import '../screens/notadetalles.dart';

class NotasADD extends StatelessWidget {
  final Noticias data;

  const NotasADD({
     Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return Card(
    //   child: ListTile(
    //     leading: Icon(Icons.person),
    //     trailing: Icon(Icons.view_list),
    //     title: Text(
    //       data.name!,
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         EnterExitRoute(
    //           exitPage: Home(),
    //           enterPage: Details(student: data),
    //         ),
    //       );
    //     },
    //   ),
    // );




    return
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            EnterExitRoute(
              exitPage: Home(),
              enterPage: Details(students: data),
            ),
          );
        },
          child: Card(
              color: Colors.black,
              child:ClipRRect(
          borderRadius: false
              ? BorderRadius.circular(0)
              : BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.network(
                data.age!,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 300,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                  child: Text(
                    data.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), ),);
  }
}
