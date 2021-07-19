import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                border: Border.symmetric(),
                color: Colors.lightBlue.shade800,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/eac.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Bienvenido'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Mis Dispositivos'),
            onTap: () => {Navigator.pushReplacementNamed(context, 'listar')},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Agregar Dispositivo'),
            onTap: () => {Navigator.pushReplacementNamed(context, 'devices')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesion'),
            onTap: () => {Navigator.pushReplacementNamed(context, 'register')},
          ),
        ],
      ),
    );
  }
}
