// To parse this JSON data, do
//
//     final puntoReciclaje = puntoReciclajeFromJson(jsonString);

import 'dart:convert';

PuntoReciclaje puntoReciclajeFromJson(String str) =>
    PuntoReciclaje.fromJson(json.decode(str));

String puntoReciclajeToJson(PuntoReciclaje data) => json.encode(data.toJson());

class PuntoReciclaje {
  PuntoReciclaje({
    this.idTipoEquipamiento,
    this.idEquipamiento,
    this.tipoEquipamiento,
    this.x,
    this.y,
    this.mancomunidad,
    this.localidad,
    this.direccion,
    this.horario,
    this.comentarios,
    this.fechaUltimaActualizacion,
    this.despuesQue,
  });

  String idTipoEquipamiento;
  String idEquipamiento;
  String tipoEquipamiento;
  String x;
  String y;
  String mancomunidad;
  String localidad;
  String direccion;
  String horario;
  String comentarios;
  String fechaUltimaActualizacion;
  String despuesQue;

  factory PuntoReciclaje.fromJson(Map<String, dynamic> json) => PuntoReciclaje(
        idTipoEquipamiento: json["ID Tipo Equipamiento"],
        idEquipamiento: json["ID Equipamiento"],
        tipoEquipamiento: json["TipoEquipamiento"],
        x: json["x"],
        y: json["y"],
        mancomunidad: json["Mancomunidad"],
        localidad: json["Localidad"],
        direccion: json["Dirección"],
        horario: json["Horario"],
        comentarios: json["Comentarios"],
        fechaUltimaActualizacion: json["Fecha última actualización"],
        despuesQue: json["¿Después qué?"],
      );

  Map<String, dynamic> toJson() => {
        "ID Tipo Equipamiento": idTipoEquipamiento,
        "ID Equipamiento": idEquipamiento,
        "TipoEquipamiento": tipoEquipamiento,
        "x": x,
        "y": y,
        "Mancomunidad": mancomunidad,
        "Localidad": localidad,
        "Dirección": direccion,
        "Horario": horario,
        "Comentarios": comentarios,
        "Fecha última actualización": fechaUltimaActualizacion,
        "¿Después qué?": despuesQue,
      };
}
