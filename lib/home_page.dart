import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer(),
   async;
   void initState() {
     super.initState();
   }
    double zoomVal=5.0;
   
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
           onPressed: () {}
        ),
        title: Text("Bogota"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
             onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
         _zoomplusfunction(),
         SizedBox(height: 200,),
          _buildContainer(),
        ],
      ),
    );
  }

Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }


 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(4.5974659,	-74.0697457), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(4.5974659,	-74.0697457), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical:20.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 08.0),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child:  _boxes(
              "https://eloutput.com/app/uploads-eloutput.com/2019/03/sonic-real-imagen-pelicula.jpg",
              4.5978464,-74.0696784, "Erre"),
            ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child:  _boxes(
              "https://eloutput.com/app/uploads-eloutput.com/2019/03/sonic-real-imagen-pelicula.jpg",
              4.5974659,-74.0697457, "el primero de la base de excel"),
            ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child:  _boxes(
              "https://eloutput.com/app/uploads-eloutput.com/2019/03/sonic-real-imagen-pelicula.jpg",
              4.5974276,	-74.0696992, "ojo con la info"),
            ),
          ],
        ),
      ),
    );
  }


  Widget _boxes(String _image, double lat, double long, String restauranteName){
    return GestureDetector(
      onTap: (){
        _gotoLocation(lat,long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color:Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image:NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: myDetailsContainer1(restauranteName),
                ),
              ],
            )
          ),
      ),
      )
    );
  }


Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }


  Widget _buildGoogleMap(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
         initialCameraPosition: CameraPosition(target: LatLng(4.5974659, -74.0697457),zoom: 12),
         onMapCreated: (GoogleMapController controller){
           _controller.complete(controller);
         },
         markers:{
           bogota1Marker,bogota2Marker,bogota3Marker,gramercyMarker,bernardinMarker, blueMarker
         },
      ),
      );
  }

  Future<void> _gotoLocation(double lat,double long) async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,long), zoom:15, tilt:50.0, bearing: 45.0,)));
  }

}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(4.5970866,-74.0689032),
  infoWindow: InfoWindow(title:'Gramercy tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
    ),
  );

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(4.5989093,	-74.0700421),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(4.5994718,	-74.0696151),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bogota1Marker=Marker(
  markerId: MarkerId('bogota1'),
  position: LatLng(4.5974659, -74.0697457),
  infoWindow: InfoWindow(title:'Traer titulo de la base de datos. el primero.' ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
    ),
  );

Marker bogota2Marker=Marker(
  markerId: MarkerId('bogota2'),
  position: LatLng(4.5978464,-74.0696784),
  infoWindow: InfoWindow(title:'Traer titulo de la base de datos. erre.' ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
    ),
  );

  Marker bogota3Marker=Marker(
  markerId: MarkerId('bogota3'),
  position: LatLng(4.5974276,-74.0696992),
  infoWindow: InfoWindow(title:'Traer titulo de la base de datos. Toto_Ilustrator.' ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
   ),
  );
