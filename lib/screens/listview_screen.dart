import 'package:flutter/material.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Screen"),
      ),
      body: ListView(
        children: _listaElementos(),
      ),
    );
  }

  List<Widget> _listaElementos() {
    List<Widget> lista = [];
    puntosProvider.listaTipos.forEach((tipo) {
      final tile = new ListTile(
        title: Text(tipo),
      );
      lista.add(tile);
      lista.add(Divider());
    });
    return lista;
  }
}
