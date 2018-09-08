import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'historial-page.dart';

class DocumentChart extends StatefulWidget {
  QuerySnapshot snapshot;
  final int ano;
  final String mes;
  final int dia;
  final CollectionReference fs = Firestore.instance
      .collection('Piscis')
      .document('Historial')
      .collection('Sensores');
  List<LinearSales> datos;
  DocumentChart({this.snapshot, this.ano, this.mes, this.dia, this.datos});
  @override
  _DocumentChartState createState() => _DocumentChartState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

List<LinearSales> _extraerTemperaturas(QuerySnapshot snapshot) {
  int i = 0;
  List<LinearSales> datos = snapshot.documents.map((DocumentSnapshot documento){
    return new LinearSales(documento.data['PH'], documento.data['Temperatura']);
  }).toList();
  return datos;
}

_generarDatos(QuerySnapshot snapshot) {
  List<LinearSales> temperatura = [
    new LinearSales(0, 5),
    new LinearSales(1, 25),
    new LinearSales(2, 100),
    new LinearSales(3, 75),
  ].toList();
  var series = [
    new Series(
        id: 'Temperatura',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: _extraerTemperaturas(snapshot)),
  ];
  return series;
}

class _DocumentChartState extends State<DocumentChart> {
  @override
  Widget build(BuildContext context) {
    var query = this
        .widget
        .fs
        .where('Año', isEqualTo: 2018)
        .where('Mes', isEqualTo: 'Septiembre')
        .where('Dia', isEqualTo: 4)
        .snapshots()
        .map((snapshot) {
      return snapshot;
    });
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Chart'),
          backgroundColor: Colors.teal,
        ),
        body: new Center(
          child: Padding(
            padding: new EdgeInsets.all(32.0),
            child: SizedBox(
                height: 200.0,
                child: StreamBuilder(
                    stream: this
                        .widget
                        .fs
                        .where('Año', isEqualTo: 2018)
                        .where('Mes', isEqualTo: 'Septiembre')
                        .where('Dia', isEqualTo: 4)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return LineChart<LinearSales>(
                        _generarDatos(snapshot.data),
                        animate: true,
                      );
                    })),
          ),
        ));
  }
}
