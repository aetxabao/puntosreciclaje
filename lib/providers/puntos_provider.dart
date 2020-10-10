import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:puntosreciclaje/models/puntoreciclaje_model.dart';
import 'package:puntosreciclaje/models/puntos_model.dart';

class PuntosProvider {
  final listaTipos = [
    'Punto limpio fijo',
    'Aceite de cocina usado',
    'Compostaje comunitario',
    'Pilas',
    'Ropa y calzado',
  ];

  List<PuntoReciclaje> listaPuntos = [];

  Future<List<PuntoReciclaje>> cargarPuntos() async {
    final data =
        await rootBundle.loadString('assets/data/ReciclajesGlobal.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    listaPuntos = puntos.lista;
    return listaPuntos;
  }
}

final puntosProvider = new PuntosProvider();
