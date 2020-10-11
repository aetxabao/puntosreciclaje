import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
import 'package:puntosreciclaje/screens/listpuntos_screen.dart';

class MapaPuntosScreen extends StatefulWidget {
  @override
  _MapaPuntosScreenState createState() => _MapaPuntosScreenState();
}

class _MapaPuntosScreenState extends State<MapaPuntosScreen> {
  PuntoReciclaje pr = null;

  @override
  Widget build(BuildContext context) {
    pr = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: _flutterMap(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAll(ListaPuntosScreen());
        },
      ),
    );
  }

  _flutterMap() {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(double.parse(pr.x), double.parse(pr.y)),
        zoom: 18.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoiYWV0eGFiYW8iLCJhIjoiY2tnNHltbHZyMHBqMzJ5cjI5bXd4YzRkOSJ9.AA2XNQgBS47ru9ZXidYX2g',
            'id': 'mapbox.satellite',
          },
        ),
        new MarkerLayerOptions(
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
        ),
      ],
    );
  }
}
