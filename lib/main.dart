import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_mancomunidades_screen.dart';
import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
// import 'package:puntosreciclaje/screens/lista_localidades_screen.dart';
// import 'package:puntosreciclaje/screens/lista_puntos_screen.dart';
// import 'package:puntosreciclaje/screens/lista_tipos_screen.dart';
// import 'package:puntosreciclaje/screens/listpuntos_screen.dart';
// import 'package:puntosreciclaje/screens/listview_screen.dart';

//void main() => runApp(MyApp());
main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String mancomunidad = box.read('mancomunidad');
    String localidad = box.read('localidad');
    String tipo = box.read('tipo');
    return GetMaterialApp(
      // Before: MaterialApp(
      title: 'Material App',
      home: (tipo != null)
          ? ListaPuntosScreen()
          : (localidad != null)
              ? ListaTiposScreen()
              : (mancomunidad != null)
                  ? ListaLocalidadesScreen()
                  : ListaMancomunidadesScreen(),
      //home: ListaMancomunidadesScreen(),
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
