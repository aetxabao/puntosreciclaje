import 'package:flutter/material.dart';
import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
// import 'package:puntosreciclaje/screens/listpuntos_screen.dart';
// import 'package:puntosreciclaje/screens/listview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'mancomunidades',
      routes: <String, WidgetBuilder>{
        'mancomunidades': (context) => ListaMancomunidadesScreen(),
        'localidades': (context) => ListaLocalidadesScreen(),
        'tipos': (context) => ListaTiposScreen(),
        'puntos': (context) => ListaPuntosScreen(),
      },
      // home:
      //     ListaPuntosScreen(), //ListaTiposScreen(), //ListaLocalidadesScreen(),
      // //ListaMancomunidadesScreen(), //ListPuntosScreen(), //ListViewScreen(),
    );
  }
}
