import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/next_wakuchinpage.dart';

void main() => runApp(MyApp());
//変更加えました
//変更できているかな
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.68, 139.76),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.68, 139.76),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final LatLng _kMapCenter1 =
  LatLng(35.85, 139.64);//さいたま市

  static final LatLng _kMapCenter2 =
  LatLng(35.69, 139.7);//新宿区

  static final LatLng _kMapCenter3 =
  LatLng(35.77, 139.8);//足立区

  static final LatLng _kMapCenter4 =
  LatLng(35.89, 139.79);//越谷市

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter1,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(title: "+30")),
      Marker(
        markerId: MarkerId("marker_2"),
        position: _kMapCenter2,
        icon: BitmapDescriptor.defaultMarkerWithHue(240.0),
        infoWindow: InfoWindow(title: "-100")),
      Marker(
        markerId: MarkerId("marker_3"),
        position: _kMapCenter3,
        icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
        infoWindow: InfoWindow(title: "0")),
      Marker(
        markerId: MarkerId("marker_4"),
        position: _kMapCenter4,
        icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
        infoWindow: InfoWindow(title: "+80")),
    };
  }

  Future<BitmapDescriptor> getMarker() async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();

    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint();
    paint.color = Colors.red;
    canvas.drawCircle(Offset(100, 35), 25, paint);

    final image = await pictureRecorder.endRecording().toImage(100, 100);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List bytes = data!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:Stack(
        /*child:ElevatedButton(
            child: Text('ElevatedButton'),
            onPressed: () {}
        ),*/

        children: <Widget>[
      // Positionedで配置
          /*ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            ),
            onPressed: null,
            child: const Text('Disabled'),
          ),*/
        GoogleMap(
        mapType: MapType.terrain,
        markers: _createMarker(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
          /*ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            ),
            onPressed: (){


            },
            child: const Text('Disabled'),
          ),*/
         Positioned(
          bottom: 10.0,
          left: 10.0,
          width: 150.0,
          height: 60.0,
           child: ElevatedButton(
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Colors.blue),
               padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
             ),
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => NextPage()),
               );
             },
             child:Text('発送したい方',
               style:TextStyle(
                 color:Colors.black,
                 fontSize:15,
               ),),
           ),
         ),
           /*Positioned(
            bottom: 10.0,
            left: 10.0,
            width: 150.0,
            height: 50.0,
            child: WidgetD(),
          ),*/
          Positioned(
            bottom: 10.0,
            right: 10.0,
            width: 150.0,
            height: 60.0,
            child: WidgetE(),
          ),
        ],
        //fit: StackFit.expand,
      ),

     // floatingActionButton: FloatingActionButton.extended(
    //floatingActionButton: FloatingActionButton.extended(
        //onPressed: _goToTheLake,
        //label: Text('受け入れたい方'),
        //icon: Icon(Icons.directions_boat),
      //),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class WidgetD extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Container(
    alignment: Alignment(0.0, 0.0),
    color: Colors.lightBlue,
    child: Text('発送したい方'),
  );
 }
}

class WidgetE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      color: Colors.blue,
      child: Text('受け取りたい方'),
    );
  }
}