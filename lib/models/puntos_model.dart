import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';

class Puntos {
  List<PuntoReciclaje> lista = new List();
  Puntos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = PuntoReciclaje.fromJson(json);
      lista.add(pr);
    });
  }
}
