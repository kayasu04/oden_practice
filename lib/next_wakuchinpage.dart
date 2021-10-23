import 'package:flutter/material.dart';
import 'package:googlemap/MatChing.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '発送要望通知'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

class NextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("緊急発送したい方"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Row(
                children:<Widget>[
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child:Text('数量',
                      style:TextStyle(
                        fontSize:20,
                      ),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child:Text('100',
                      style:TextStyle(
                        fontSize:20,
                      ),),),
                ]),
            Row(
                children:<Widget>[
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child:Text('発送可能時間帯',
                      style:TextStyle(
                        fontSize:20,
                      ),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child:Text('13:00',
                      style:TextStyle(
                        fontSize:20,
                      ),),),
                ]),
            Row(
                children:<Widget>[
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child:Text('ワクチン使用期限',
                      style:TextStyle(
                        fontSize:20,
                      ),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child:Text('17:00',
                      style:TextStyle(
                        fontSize:20,
                      ),),),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MatChing()),
                      );
                    } ,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      elevation: 16,
                    ),
                    child:Text('決定',
                      style:TextStyle(
                        fontSize:20,
                      ),),),
                ]),

          ],
        ),
      ),
    );
  }
}