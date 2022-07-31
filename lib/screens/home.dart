import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '../models/noticias.dart';
import '../widgets/nn.dart';
import '../widgets/nns.dart';

import '../env.dart';
import '../page_transitions.dart';
import '../models/Tutorial.dart';
import './details.dart';
import './create.dart';
import '../widgets/notasd.dart';
import '../widgets/mock_data.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<Tutorial>> students;
  final studentListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    students = getStudentList();
  }

  Future<List<Tutorial>> getStudentList() async {
    final response = await http.get(Uri.parse("${Env.URL_PREFIX}"));

    final items = json.decode(response.body)['modulos'].cast<Map<String, dynamic>>();




for (var ch in items){

if(ch['modulo']['nombre']  == "noticias"){
}


 print(ch['modulo']['nombre']);
}


        List<Tutorial> students = items.map<Tutorial>((json) {



      return Tutorial.fromJson(json);
    }).toList();

    return students;
  }

  void refreshStudentList() {
    setState(() {
      students = getStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,

      body: Center(
        child: FutureBuilder<List<Tutorial>>(
          future: students,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            final children = <Widget>[];



            for (var ch in snapshot.data){
              if(ch.name  == "noticias"){




                for (var csh in ch.author.tags){
                  print(csh['titulo']);

                  children.add(new NotasADD(data: Noticias(id:csh['imagen'],name:csh['titulo'],age:csh['imagen'])));

                  children.add(new NCards(data: Noticias(id:csh['imagen'],name:csh['titulo'],age:csh['imagen'])));

                }



                }



              print(ch.name);
            }
            children.add( GridView.count(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.50),
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't see infinite size error
              children: <Widget>[

            for ( var i = 0; i < 10; i++) new NotasADD(data: Noticias(id:"https://i0.wp.com/laboulaye.info/archivos/251644/noticias/a9ae87f569ceab08f4def917fdfa0ccd.jpg?w=800",name:"aaa",age:"https://i0.wp.com/laboulaye.info/archivos/251644/noticias/a9ae87f569ceab08f4def917fdfa0ccd.jpg?w=800"))


              ],
            ));
            for (var i = 0; i < 10; i++) {


              children.add(new NCard(data: Noticias(id:"https://i0.wp.com/laboulaye.info/archivos/251644/noticias/a9ae87f569ceab08f4def917fdfa0ccd.jpg?w=800",name:"aaa",age:"https://i0.wp.com/laboulaye.info/archivos/251644/noticias/a9ae87f569ceab08f4def917fdfa0ccd.jpg?w=800")));
            }
            return new ListView(
              children: children,
            );









            // Render student lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];





                return NCard(data: Noticias(id:"aaa",name:"aaa",age:"aaa"));


    }

             /// },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Create();
          }));
        },
      ),
    );
  }





}
