import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
// import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
// import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
// import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
// import 'package:puntosreciclaje/screens/listpuntos_screen.dart';
// import 'package:puntosreciclaje/screens/listview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Before: MaterialApp(
      title: 'Material App',
      home: ListaMancomunidadesScreen(),
      // initialRoute: 'mancomunidades',
      // routes: <String, WidgetBuilder>{
      //   'mancomunidades': (context) => ListaMancomunidadesScreen(),
      //   'localidades': (context) => ListaLocalidadesScreen(),
      //   'tipos': (context) => ListaTiposScreen(),
      //   'puntos': (context) => ListaPuntosScreen(),
      // },
      // home:
      //     ListaPuntosScreen(), //ListaTiposScreen(), //ListaLocalidadesScreen(),
      // //ListaMancomunidadesScreen(), //ListPuntosScreen(), //ListViewScreen(),
    );
  }
}
