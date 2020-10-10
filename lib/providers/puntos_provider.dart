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

  List<String> listaMancomunidades = [];
  List<String> listaLocalidadesMancomunidad = [];
  List<String> listaTiposLocalidad = [];
  List<PuntoReciclaje> listaPuntosFiltrados = [];

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

  Future<List<String>> cargarMancomunidades() async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaMancomunidades = [];
    listaPuntos.forEach((pr) {
      if (listaMancomunidades.indexOf(pr.mancomunidad) < 0) {
        listaMancomunidades.add(pr.mancomunidad);
      }
    });
    return listaMancomunidades;
  }

  Future<List<String>> cargarLocalidades(String mancomunidad) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaLocalidadesMancomunidad = [];
    listaPuntos.forEach((pr) {
      if ((pr.mancomunidad == mancomunidad) &&
          (listaLocalidadesMancomunidad.indexOf(pr.localidad) < 0)) {
        listaLocalidadesMancomunidad.add(pr.localidad);
      }
    });
    return listaLocalidadesMancomunidad;
  }

  Future<List<String>> cargarTipos(String localidad) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaTiposLocalidad = [];
    listaPuntos.forEach((pr) {
      if ((pr.localidad == localidad) &&
          (listaTiposLocalidad.indexOf(pr.tipoEquipamiento) < 0)) {
        listaTiposLocalidad.add(pr.tipoEquipamiento);
      }
    });
    return listaTiposLocalidad;
  }

  Future<List<PuntoReciclaje>> cargarPuntosFiltrados(
      String localidad, String tipo) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaPuntosFiltrados = [];
    listaPuntos.forEach((pr) {
      if ((pr.localidad == localidad) && (pr.tipoEquipamiento == tipo)) {
        listaPuntosFiltrados.add(pr);
      }
    });
    return listaPuntosFiltrados;
  }
}

final puntosProvider = new PuntosProvider();
