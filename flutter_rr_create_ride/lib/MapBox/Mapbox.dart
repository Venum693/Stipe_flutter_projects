
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rr_create_ride/MapBox/search_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Models/mapbox_search_model.dart';
import '../widgets/app_colors.dart';

class MapBoxScreen extends StatefulWidget {
  const MapBoxScreen({Key? key}) : super(key: key);

  @override
  State<MapBoxScreen> createState() => _MapBoxScreenState();
}

class _MapBoxScreenState extends State<MapBoxScreen> {
  MapController? mapController;
  double long = 106.816666;
  double lat = -6.200000;
  double zoom = 10.0;
  double rotation = 0.0;
  LatLng point = LatLng(12.77, 77.63);
  TextEditingController _start = TextEditingController();
  List<MarkerLayer> myMarker = [];
  MapBoxApi mapBoxApi = MapBoxApi();
  List<SearchPlaces>? search;

  //String startingAddress = '' ;

  var _markers = <Marker>[];

  // LatLng? p;
//var res =  placemarkFromCoordinates(12.96682941960497,77.62248077730689);

  Marker createMarker(LatLng latLng) {
    //Custom Marker
    return Marker(
      width: 80.0,
      height: 80.0,
      point: latLng,
      builder: (ctx) => Container(
        child: IconButton(
            icon: Icon(Icons.add_location),
            color: Colors.red,
            onPressed: () {}),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    //getCurrentLocation();
  }

  //Function That creates a new Marker when the UI is rebuilt
  void onMapTap(p) {
    setState(() {
      point = p;
      _markers.clear();
      _markers.add(createMarker(p));
    });
  }

  //Function that gives new marker according to the searched location
  void mapTapAfterSearch(LatLng latLng) {
    setState(() {
      point = LatLng(latLng.latitude, latLng.longitude);
      _markers.clear();
      _markers.add(createMarker(latLng));
    });
  }


  //  reverseOnScreen(LatLng latLng) async {
  //   LatLng currentLocation =
  //   LatLng(point.latitude, point.longitude);
  //   await mapBoxApi.reverseGeoCoding(currentLocation);
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'Select Your Location',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.text),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
                onTap: (value, p) async {
                  // var result = await reverseGeoCoding(LatLng(p.latitude,p.longitude));
                  // String res = result['place_name'];
                  // List<Placemark> loc = await placemarkFromCoordinates(p.latitude, p.longitude);
                  // Placemark place = loc[0];

                  // String? res= await reverseOnScreen(LatLng(p.latitude, p.longitude));
                  // print(res);

                  // print(res);

                  //Mapbox reverse coding to get address
                  List<SearchPlaces?> result = await mapBoxApi
                      .reverseGeoCoding(LatLng(p.latitude, p.longitude));
                  print(result[0]?.placeName.toString());

                  onMapTap(p);
                  //Moves the map according to the latitude and longitude values and sends the result to setState in getAddress function
                  mapController?.move(LatLng(p.latitude, p.longitude), 13);
                  Navigator.pop(context, result[0]?.placeName.toString());

                  // setState(() {
                  //   long = p.longitude;
                  //   lat = p.latitude;
                  //   point = p;

                  //   print(p);
                  //   print(long);
                  //   print(lat);
                  //  print('${place.name}, ${place.locality}, ${place.street}, ${place.country}');
                  //print('${value}');
                  //   //Navigator.pop(context,'${place.name}, ${place.locality}, ${place.street}, ${place.country}');
                  //   //Navigator.pop(context,'${p.latitude}');
                  // });
                  //print('${p.latitude} - ${p.longitude}');
                },
                minZoom: 5,
                maxZoom: 18,
                zoom: 15,
                center: point),
//https://api.mapbox.com/styles/v1/wcky/clbopc5rr000214o9vvvk7922/tiles/256/%7Bz%7D/%7Bx%7D/%7By%7D@2x?access_token=pk.eyJ1Ijoid2NreSIsImEiOiJjbGI2ZnFocXMwMHNjM3dxcGR4bmxkeTNpIn0.YPoGq_pEKOCbaf_n-2lNbw
            children: [
              TileLayer(
                urlTemplate:
                'https://api.mapbox.com/styles/v1/stipe007/cldo5hmi3004901qqkao0uk89/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3RpcGUwMDciLCJhIjoiY2xkbzR5azV0MDZqeTNucXZ0cGFhNDBjdyJ9.CeSwdiC2C4oT1O3V4F61fQ',
                additionalOptions: {
                  'accessToken':
                  "pk.eyJ1Ijoic3RpcGUwMDciLCJhIjoiY2xkbzR5azV0MDZqeTNucXZ0cGFhNDBjdyJ9.CeSwdiC2C4oT1O3V4F61fQ",
                  'id': 'mapbox.mapbox-streets-v8',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      width: 100.0,
                      height: 100.0,
                      point: point,
                      builder: (BuildContext context) {
                        return Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.yellow,
                            size: 30,
                          ),
                        );
                      })
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: AppColors.containerFill,
                      // border: Border.all(
                      //     color: AppColors.yellowBorder,
                      //     width: 1.5,
                      //     style: BorderStyle.solid),
                    ),
                    child: TextFormField(
                      controller: _start,

                      onTap: () async {
                        //Navigates to Search Screen
                        final SearchPlaces? result = await showSearch(
                            context: context,
                            delegate: SearchScreen(),
                            query: _start.text);

                        if (result != null) {
                          setState(() {
                            //TextField is filled with the selected address
                            _start.text = result.placeName!;

                            mapTapAfterSearch(LatLng(
                                result.geometry.coordinates![1],
                                result.geometry.coordinates![0]));

                            //Moves the map according to the selected address
                            mapController?.move(
                                LatLng(result.geometry.coordinates![1],
                                    result.geometry.coordinates![0]),
                                16);

                            print(result.geometry.coordinates![0].toString());
                            print(result.geometry.coordinates![1].toString());
                            //Navigator.pop(context,result.placeName);
                          });
                        }
                      },

                      // onChanged: (value) {
                      //
                      // },
                      // onFieldSubmitted: (val) async {
                      //   final query = val;
                      //   var address = await locationFromAddress(query);
                      //   var first = address.first;
                      //   setState(() {
                      //     long = first.longitude;
                      //     lat = first.latitude;
                      //     point = LatLng(first.latitude, first.longitude);
                      //     mapController?.move(LatLng(first.latitude, first.longitude), 18);
                      //   });
                      //   print('${first.latitude},${first.longitude}');
                      //   print('${point}');
                      // },

                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: AppColors.yellow),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: "Click to Search different Places",
                        hintStyle:
                        Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: AppColors.yellow,
                        ),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Container(
                      height: screenHeight * 0.06,
                      //width: screenWidth / 1.21,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: AppColors.containerFill,
                      ),
                      // color: AppColors.lightGrey,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tap anywhere on the Map to confirm your Location',
                            textScaleFactor: 1,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w800),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )),

                  // ElevatedButton(onPressed: () {
                  //   sendLocationToFirstScreen(context);},
                  //   child: Text('confirm Location'),),

                  // SizedBox(height: 10,),

                  // Text('Changes',style: TextStyle(color: AppColors.black),)

                  //child:
                  // TextFormField(
                  //   onChanged: (value) {
                  //
                  //   },
                  //   onFieldSubmitted: (val) async {
                  //     final query = val;
                  //     var address = await locationFromAddress(query);
                  //     var first = address.first;
                  //     setState(() {
                  //       long = first.longitude;
                  //       lat = first.latitude;
                  //       point = LatLng(first.latitude, first.longitude);
                  //       //mapController?.move(LatLng(first.latitude, first.longitude), 18);
                  //     });
                  //     print('${first.latitude},${first.longitude}');
                  //     print('${point}');
                  //   },
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.all(16.0),
                  //     hintText: "Add Location",
                  //     prefixIcon: Icon(Icons.location_on_outlined),
                  //   ),
                  // ),

                  // SizedBox(height: 600,),

                  // ElevatedButton(onPressed: () {
                  //   sendLocationToFirstScreen(context);
                  // }, child: Text('confirm Location'),)
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 25,
              child: GestureDetector(
                  onTap: () {
                    getCurrentLocation();
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.my_location_rounded,
                      size: 40,
                      color: AppColors.yellow,
                    ),
                  )))
        ],
      ),
    );
  }

  //Function to capture the address from the map
  void sendLocationToFirstScreen(BuildContext context) {
    Navigator.pop(context, _start.text);
  }

  //moves the map to the users current location
  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(openAppSettings());
    }

    var myPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // List<SearchPlaces?> result = await convertLL(LatLng(
    //     myPosition.latitude.toDouble(),
    //     myPosition.longitude.toDouble()));

    // loca.Location location = loca.Location();
    //
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    // LocationData _locationData;
    //
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }
    //
    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    // _locationData = await location.getLocation();

    setState(() {


      onMapTap(LatLng(
          myPosition.latitude.toDouble(), myPosition.longitude.toDouble()));

      mapController?.move(
          LatLng(
              myPosition.latitude.toDouble(), myPosition.longitude.toDouble()),
          15);
      //_center = LatLng(_locationData.latitude, _locationData.longitude);
      //_mapController.move(LatLng(_locationData.latitude, _locationData.longitude), 13.0);
    });
  }
}