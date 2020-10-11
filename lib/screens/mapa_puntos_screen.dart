import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puntosreciclaje/widgets/menu_widget.dart';

class MapaPuntosScreen extends StatefulWidget {
  @override
  _MapaPuntosScreenState createState() => _MapaPuntosScreenState();
}

class _MapaPuntosScreenState extends State<MapaPuntosScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  final map = new MapController();
  PuntoReciclaje pr;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    pr = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        actions: [
          IconButton(
              icon: Icon(Icons.gps_fixed),
              onPressed: () {
                _miPosicion();
              }),
        ],
      ),
      drawer: MenuWidget(),
      body: _flutterMap(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAll(ListaPuntosScreen());
        },
      ),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      mapController: map,
      options: new MapOptions(
        center: new LatLng(double.parse(pr.x), double.parse(pr.y)),
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
        _position(),
      ],
    );
  }

  void _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiYWV0eGFiYW8iLCJhIjoiY2tnNHltbHZyMHBqMzJ5cjI5bXd4YzRkOSJ9.AA2XNQgBS47ru9ZXidYX2g',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(double.parse(pr.x), double.parse(pr.y)),
          builder: (ctx) => new Container(
            child: ImageIcon(AssetImage('assets/images/flor.png')),
          ),
        ),
      ],
    );
  }

  _position() {
    if (_currentPosition == null) return MarkerLayerOptions();
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point:
              new LatLng(_currentPosition.latitude, _currentPosition.longitude),
          builder: (ctx) => new Container(
            child: Icon(
              Icons.location_on,
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  }

  void _miPosicion() {
    if (_currentPosition != null) {
      map.move(
          new LatLng(_currentPosition.latitude, _currentPosition.longitude),
          16);
    }
  }
}
