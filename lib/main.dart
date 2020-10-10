import 'package:flutter/material.dart';
import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
import 'package:puntosreciclaje/screens/listpuntos_screen.dart';
import 'package:puntosreciclaje/screens/listview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListaTiposScreen(), //ListaLocalidadesScreen(),
      //ListaMancomunidadesScreen(), //ListPuntosScreen(), //ListViewScreen(),
    );
  }
}
