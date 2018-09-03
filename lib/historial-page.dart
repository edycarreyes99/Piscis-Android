import 'package:flutter/material.dart';import 'navside.dart';import 'auth.dart';import 'package:cloud_firestore/cloud_firestore.dart';class HistorialPage extends StatefulWidget {  HistorialPage({this.auth, this.onCerrarSesion});  final BaseAuth auth;  final VoidCallback onCerrarSesion;  final CollectionReference fs = Firestore.instance.collection('Piscis').document('Historial').collection('Sensores');  @override  _HistorialPageState createState() => _HistorialPageState();}class _HistorialPageState extends State<HistorialPage> {  /*Widget bodyData() => DataTable(        onSelectAll: (b) {},        sortColumnIndex: 0,        sortAscending: true,        columns: <DataColumn>[          DataColumn(            label: Text("ID"),            numeric: false,            onSort: (i, b) {              print('$i $b');              setState(() {                names.sort((a, b) => a.firstName.compareTo(b.firstName));              });            },            tooltip: "El identificador Unico del dato",          ),          DataColumn(              label: Text("Valor"),              numeric: false,              onSort: (i, b) {},              tooltip: "El valor promedio de la temperatura"),        ],        rows: names            .map((name) => DataRow(cells: [                  DataCell(Text(name.firstName)),                  DataCell(Text(name.lastName)),                ]))            .toList(),      );*/  @override  Widget build(BuildContext context) {    String _value;    String _ano,_mes,_dia;    return Scaffold(        appBar: new AppBar(            title: Text(              'Historial',              style: new TextStyle(fontFamily: 'Nunito'),            ),            backgroundColor: Colors.deepPurple),        drawer: new SideNav(          auth: this.widget.auth,          onCerrarSesion: this.widget.onCerrarSesion,        ),        body: ListView(          children: <Widget>[        new Column(        children: <Widget>[          new Card(          elevation: 5.0,          margin: EdgeInsets.all(20.0),          child: new Column(            mainAxisSize: MainAxisSize.min,            children: <Widget>[              new Center(                child: Text(                  'Filtrar Datos',                  style: TextStyle(                      color: Colors.indigo,                      fontSize: 30.0,                      fontFamily: 'Nunito'),                ),              ),              new Center(                child: new DropdownButtonHideUnderline(                  child: new DropdownButton<String>(                    hint: new Text('Año'),                    value: _value,                    items: <DropdownMenuItem<String>>[                      new DropdownMenuItem(                          child: new Text('Perfil'), value: 'one'),                      new DropdownMenuItem(                          child: new Text('Agregar Usuario'),                          value: 'two')                    ],                    onChanged: (String value) {                      print(value);                      setState(() => _value = value);                    },                  ),                ),              ),              new Center(                child: new DropdownButtonHideUnderline(                  child: new DropdownButton<String>(                    hint: new Text('Mes'),                    value: _value,                    items: <DropdownMenuItem<String>>[                      new DropdownMenuItem(                          child: new Text('Perfil'), value: 'one'),                      new DropdownMenuItem(                          child: new Text('Agregar Usuario'),                          value: 'two')                    ],                    onChanged: (String value) {                      print(value);                      setState(() => _value = value);                    },                  ),                ),              ),              new Center(                child: new DropdownButtonHideUnderline(                  child: new DropdownButton<String>(                    hint: new Text('Dia'),                    value: _value,                    items: <DropdownMenuItem<String>>[                      new DropdownMenuItem(                          child: new Text('Perfil'), value: 'one'),                      new DropdownMenuItem(                          child: new Text('Agregar Usuario'),                          value: 'two')                    ],                    onChanged: (String value) {                      print(value);                      setState(() => _value = value);                    },                  ),                ),              )            ],          ),        ),            ],        ),            Column(              mainAxisAlignment: MainAxisAlignment.center,              children: <Widget>[                StreamBuilder(                  stream: Firestore.instance.collection('Piscis/Historial/Sensores').snapshots(),                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){                    if(!snapshot.hasData) return CircularProgressIndicator();                    return FirestoreListView(documents: snapshot.data.documents);                  },                ),              ],            ),          ],        )    );  }}class FirestoreListView extends StatelessWidget {  final List<DocumentSnapshot> documents;  FirestoreListView({this.documents});  @override  Widget build(BuildContext context) {    return  new StreamBuilder(      stream: Firestore.instance.collection('Piscis/Historial/Sensores').snapshots(),      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {        if (!snapshot.hasData) return new Text('Loading...');        String _ano;        String _mes;        String _dias;        return Column(          children: <Widget>[            Padding(              padding: const EdgeInsets.all(20.0),              child: Center(                child: new DataTable(                onSelectAll: (b) {},                sortColumnIndex: 0,                sortAscending: true,                columns: <DataColumn>[                  new DataColumn(label: Text('Key')),                  new DataColumn(label: Text('Detalles')),                ],                rows: _crearRows(snapshot.data),              )),            )          ],        );      },    );  }}List<DataRow> _crearRows(QuerySnapshot snapshot) {  List<DataRow> Lista = snapshot.documents.map((DocumentSnapshot documentSnapshot) {    return new DataRow(cells: [      DataCell(Text(documentSnapshot.documentID)),      DataCell(Center(          child: CircleAvatar(          radius: 15.0,          backgroundColor: Colors.red,          child: Icon(Icons.add,color: Colors.white,size: 20.0,),          )        )      ),    ]);  }).toList();  return Lista;}//TODO Clases de los dropdownsclass Anos{  int ano;  Anos({this.ano});}class Meses{  String mes;  Meses({this.mes});}class Dias{  int dia;  Dias({this.dia});}var meses = <Meses>[  Meses(mes: 'Enero'),  Meses(mes: 'Febrero'),  Meses(mes: 'Marzo'),  Meses(mes: 'Abril'),  Meses(mes: 'Mayo'),  Meses(mes: 'Junio'),  Meses(mes: 'Julio'),  Meses(mes: 'Agosto'),  Meses(mes: 'Septiembre'),  Meses(mes: 'Octubre'),  Meses(mes: 'Noviembre'),  Meses(mes: 'Diciembre'),];var anos = <Anos>[  Anos(ano:2018),  Anos(ano:2019),  Anos(ano:2020),  Anos(ano:2021),  Anos(ano:2022),  Anos(ano:2023),  Anos(ano:2024),  Anos(ano:2025),  Anos(ano:2026),  Anos(ano:2027),  Anos(ano:2028),  Anos(ano:2029),  Anos(ano:2030),  Anos(ano:2031),  Anos(ano:2032),  Anos(ano:2033),  Anos(ano:2034),  Anos(ano:2035),  Anos(ano:2036),  Anos(ano:2037),  Anos(ano:2038),];var dias = <Dias>[  Dias(dia: 1),  Dias(dia: 2),  Dias(dia: 3),  Dias(dia: 4),  Dias(dia: 5),  Dias(dia: 6),  Dias(dia: 7),  Dias(dia: 8),  Dias(dia: 9),  Dias(dia: 10),  Dias(dia: 11),  Dias(dia: 12),  Dias(dia: 13),  Dias(dia: 14),  Dias(dia: 15),  Dias(dia: 16),  Dias(dia: 17),  Dias(dia: 18),  Dias(dia: 19),  Dias(dia: 20),  Dias(dia: 21),  Dias(dia: 22),  Dias(dia: 23),  Dias(dia: 24),  Dias(dia: 25),  Dias(dia: 26),  Dias(dia: 27),  Dias(dia: 28),  Dias(dia: 29),  Dias(dia: 30),  Dias(dia: 31)];