import 'package:electronic/src/pages/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuPage(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu_rounded,
            ),
            onPressed: () => ({_scaffoldKey.currentState!.openDrawer()})),
      ),
      body: Container(child: miCard()),
    );
  }
}

Card miCard() {
  var _lights = false;

  return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: EdgeInsets.all(15),

      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Column(
        children: [
          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              '-- °C',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              'Temperatura Promedio 17°C',
              style: TextStyle(fontSize: 15),
            ),
            leading: Icon(
              Icons.thermostat_sharp,
              color: Colors.accents.first,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              '-- °C',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              'Temperatura Microcontrolador',
              style: TextStyle(fontSize: 15),
            ),
            leading: Icon(
              Icons.thermostat_sharp,
              color: Colors.accents.first,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              '-- Volst',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              'Voltaje',
              style: TextStyle(fontSize: 15),
            ),
            leading: Icon(Icons.electrical_services_outlined,
                color: Colors.yellowAccent),
          ),
          ListTile(
            title: Text('LED 1'),
            trailing: CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: Text('LED 2'),
            trailing: CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {},
            ),
          )
        ],
      ));
}
