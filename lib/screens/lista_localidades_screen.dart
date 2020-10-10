import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';

class ListaLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('localidad', null);
    box.write('tipo', null);
    //args = ModalRoute.of(context).settings.arguments;
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Localidades"),
      ),
      body: _lista(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Get.offAll(ListaMancomunidadesScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: puntosProvider
          .cargarLocalidades(box.read('mancomunidad') ?? args['mancomunidad']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('localidad', element);
          args['localidad'] = element;
          //Navigator.pushNamed(context, 'tipos', arguments: args);
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
