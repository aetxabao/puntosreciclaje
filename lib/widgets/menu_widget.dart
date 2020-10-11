import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';

class MenuWidget extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String mancomunidad = box.read('mancomunidad');
    String localidad = box.read('localidad');
    String tipo = box.read('tipo');
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/recicla.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.business, color: Colors.green),
          title: Text('Mancomunidad'),
          onTap: () {
            Get.offAll(ListaMancomunidadesScreen());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_city, color: Colors.green),
          title: Text('Localidades'),
          onTap: () {
            if (mancomunidad != null) {
              Get.offAll(ListaLocalidadesScreen());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.kitchen, color: Colors.green),
          title: Text('Tipos'),
          onTap: () {
            if (localidad != null) {
              Get.offAll(ListaTiposScreen());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.gps_fixed, color: Colors.green),
          title: Text('Puntos'),
          onTap: () {
            if ((localidad != null) && (tipo != null)) {
              Get.offAll(ListaPuntosScreen());
            }
          },
        ),
        Divider(),
      ]),
    );
  }
}
