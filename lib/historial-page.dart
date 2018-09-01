import 'package:flutter/material.dart';
import 'navside.dart';
import 'auth.dart';
import 'data-table.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class HistorialPage extends StatefulWidget {
  HistorialPage({this.auth, this.onCerrarSesion});
  final BaseAuth auth;
  final VoidCallback onCerrarSesion;
  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  Widget bodyData() => DataTable(
        onSelectAll: (b) {},
        sortColumnIndex: 0,
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text("ID"),
            numeric: false,
            onSort: (i, b) {
              print('$i $b');
              setState(() {
                names.sort((a, b) => a.firstName.compareTo(b.firstName));
              });
            },
            tooltip: "El identificador Unico del dato",
          ),
          DataColumn(
              label: Text("Valor"),
              numeric: false,
              onSort: (i, b) {},
              tooltip: "El valor promedio de la temperatura"),
        ],
        rows: names
            .map((name) => DataRow(cells: [
                  DataCell(Text(name.firstName)),
                  DataCell(Text(name.lastName)),
                ]))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    String _value;
    return Scaffold(
        appBar: new AppBar(
            title: Text(
              'Historial',
              style: new TextStyle(fontFamily: 'Nunito'),
            ),
            backgroundColor: Colors.deepPurple),
        drawer: new SideNav(
          auth: this.widget.auth,
          onCerrarSesion: this.widget.onCerrarSesion,
        ),
        body: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(20.0),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Center(
                        child: Text(
                          'Filtrar Datos',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 30.0,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      new Center(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: new Text('Año'),
                            value: _value,
                            items: <DropdownMenuItem<String>>[
                              new DropdownMenuItem(
                                  child: new Text('Perfil'), value: 'one'),
                              new DropdownMenuItem(
                                  child: new Text('Agregar Usuario'),
                                  value: 'two')
                            ],
                            onChanged: (String value) {
                              print(value);
                              setState(() => _value = value);
                            },
                          ),
                        ),
                      ),
                      new Center(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: new Text('Mes'),
                            value: _value,
                            items: <DropdownMenuItem<String>>[
                              new DropdownMenuItem(
                                  child: new Text('Perfil'), value: 'one'),
                              new DropdownMenuItem(
                                  child: new Text('Agregar Usuario'),
                                  value: 'two')
                            ],
                            onChanged: (String value) {
                              print(value);
                              setState(() => _value = value);
                            },
                          ),
                        ),
                      ),
                      new Center(
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: new Text('Dia'),
                            value: _value,
                            items: <DropdownMenuItem<String>>[
                              new DropdownMenuItem(
                                  child: new Text('Perfil'), value: 'one'),
                              new DropdownMenuItem(
                                  child: new Text('Agregar Usuario'),
                                  value: 'two')
                            ],
                            onChanged: (String value) {
                              print(value);
                              setState(() => _value = value);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: bodyData(),
                )
              ],
            )
          ],
        ));
  }
}

class Datos {
  int ano, dia, temperatura, humedad;
  String mes, private_key_id;

  Datos(this.ano, this.mes, this.dia, this.humedad, this.private_key_id,
      this.temperatura);

  Datos.fromSnapshot(DataSnapshot snapshot);
}

class Name {
  String firstName;
  String lastName;
  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: 'Edycar', lastName: 'Reyes'),
  Name(firstName: 'Jaime', lastName: 'Carrillo'),
  Name(firstName: 'Susan', lastName: 'Vilchez'),
  Name(firstName: 'Armando', lastName: 'Rojas'),
];
