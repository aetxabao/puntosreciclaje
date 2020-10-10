import 'package:flutter/material.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';

class ListPuntosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPuntos Screen'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.cargarPuntos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
