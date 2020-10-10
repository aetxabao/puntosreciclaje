import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';

class ListaPuntosScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Puntos de Reciclaje"),
      ),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.cargarPuntosFiltrados(
          box.read('localidad') ?? args['localidad'],
          box.read('tipo') ?? args['tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(List<PuntoReciclaje> data) {
    final List<Widget> lst = [];
    data.forEach((pr) {
      final w = ListTile(
        title: Text(pr.localidad),
        subtitle: Text(pr.direccion),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // args['id'] = pr.idEquipamiento;
          // //Navigator.pushNamed(context, 'tipos', arguments: args);
          // Get.offAll(MapaPuntosScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
