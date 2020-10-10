import 'package:flutter/material.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';

class ListaPuntosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puntos de Reciclaje"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.cargarPuntosFiltrados(
          "PAMPLONA / IRUÑA (Pamplona / Iruña)", "Pilas"),
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
        onTap: () {},
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
