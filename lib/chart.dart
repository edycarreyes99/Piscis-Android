import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'historial-page.dart';

class DocumentChart extends StatefulWidget {
  final int ano;
  final String mes;
  final int dia;
  final CollectionReference fs = Firestore.instance
      .collection('Piscis')
      .document('Historial')
      .collection('Sensores');
  DocumentChart({this.ano, this.mes, this.dia});
  @override
  _DocumentChartState createState() => _DocumentChartState();
}

class LinearSales {
  final int hora;
  final int sensor;

  LinearSales(this.hora, this.sensor);
}

List<LinearSales> _extraerTemperaturas(QuerySnapshot snapshot) {
  List<LinearSales> datos =
      snapshot.documents.map((DocumentSnapshot documento) {
    return  LinearSales(
        documento.data['Hora'], documento.data['Temperatura']);
  }).toList();
  return datos;
}

List<LinearSales> _extraerHumedad(QuerySnapshot snapshot) {
  List<LinearSales> datos =
      snapshot.documents.map((DocumentSnapshot documento) {
    return  LinearSales(documento.data['Hora'], documento.data['Humedad']);
  }).toList();
  return datos;
}

List<LinearSales> _extraerPH(QuerySnapshot snapshot) {
  List<LinearSales> datos =
      snapshot.documents.map((DocumentSnapshot documento) {
    return  LinearSales(documento.data['Hora'], documento.data['PH']);
  }).toList();
  return datos;
}

List<LinearSales> _extraerOxigeno(QuerySnapshot snapshot) {
  List<LinearSales> datos =
  snapshot.documents.map((DocumentSnapshot documento) {
    return  LinearSales(documento.data['Hora'], documento.data['Oxigeno']);
  }).toList();
  return datos;
}

List<LinearSales> _extraerViscosidad(QuerySnapshot snapshot) {
  List<LinearSales> datos =
  snapshot.documents.map((DocumentSnapshot documento) {
    return  LinearSales(documento.data['Hora'], documento.data['Viscosidad']);
  }).toList();
  return datos;
}

_generarDatos(QuerySnapshot snapshot) {
  var series = [
     Series(
        id: 'Temperatura',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.hora,
        measureFn: (LinearSales sales, _) => sales.sensor,
        data: _extraerTemperaturas(snapshot)),
     Series(
        id: 'Humedad',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.hora,
        measureFn: (LinearSales sales, _) => sales.sensor,
        data: _extraerHumedad(snapshot)),
     Series(
        id: 'PH',
        colorFn: (_, __) => MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.hora,
        measureFn: (LinearSales sales, _) => sales.sensor,
        data: _extraerPH(snapshot)),
    Series(
        id: 'Oxigeno',
        colorFn: (_, __) => MaterialPalette.indigo.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.hora,
        measureFn: (LinearSales sales, _) => sales.sensor,
        data: _extraerOxigeno(snapshot)
    ),
     Series(
         id: 'Viscosidad',
         colorFn: (_, __) => MaterialPalette.gray.shadeDefault,
         domainFn: (LinearSales sales, _) => sales.hora,
         measureFn: (LinearSales sales, _) => sales.sensor,
         data: _extraerViscosidad(snapshot)
     ),
  ];
  return series;
}

class _DocumentChartState extends State<DocumentChart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  Text('Chart'),
          backgroundColor: Colors.teal,
        ),
        body:  Center(
          child: Padding(
            padding:  EdgeInsets.all(32.0),
            child: SizedBox(
                height: 200.0,
                child: StreamBuilder(
                    stream: this
                        .widget
                        .fs
                        .where('Año', isEqualTo: this.widget.ano)
                        .where('Mes', isEqualTo: this.widget.mes)
                        .where('Dia', isEqualTo: this.widget.dia)
                        .orderBy('Hora', descending: false)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // ignore: new_with_invalid_type_parameters
                      return LineChart<LinearSales>(
                        _generarDatos(snapshot.data),
                        animate: true,
                      );
                    })),
          ),
        ));
  }
}
