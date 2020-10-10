import 'package:flutter/material.dart';
import 'package:puntosreciclaje/providers/puntos_provider.dart';

class ListaMancomunidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mancomunidades"),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: puntosProvider.cargarMancomunidades(),
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
          args['mancomunidad'] = element;
          Navigator.pushNamed(context, 'localidades', arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
