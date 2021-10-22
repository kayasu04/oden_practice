import 'package:flutter/material.dart';


class MatChing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    Container(
                      color: Colors.grey,
                      width: 250,
                      height:100,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('マッチング',
                            style:TextStyle(
                              fontSize:40,
                            ),),
                          Text('調整中...',
                            style:TextStyle(
                              fontSize:40,
                            ),),
                        ],
                      ),
                    ),
                  ]
              ),
            ]),
      ),
    );
  }
}