import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';
import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:puntosreciclaje/widgets/menu_widget.dart';

class ListaTiposScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('tipo', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos"),
      ),
      drawer: MenuWidget(),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Get.offAll(ListaLocalidadesScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider
          .cargarTipos(box.read('localidad') ?? args['localidad']),
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

  List<Widget> _listaElementos(List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('tipo', element);
          args['tipo'] = element;
          //Navigator.pushNamed(context, 'tipos', arguments: args);
          Get.offAll(ListaPuntosScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
