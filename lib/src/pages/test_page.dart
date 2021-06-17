import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<TestPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register() async {
    // var url = "http://192.168.1.101/flutter-login-signup/register.php";

    var url =
        Uri.parse("https://192.168.100.174/conexion_ejemplo/registro.php");
    var response = await http.patch(url, body: {
      "users_email": email.text,
      "users_password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Text('User allready exit!',
          style: TextStyle(fontSize: 25, color: Colors.red));
    } else {
      Text('Registration Successful',
          style: TextStyle(fontSize: 25, color: Colors.green));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logo(),
                  _correo(),
                  _password(),
                  _codigoVerificacion(),
                  SizedBox(height: 10.0),
                  _guardar(),
                  SizedBox(height: 20.0),
                  _footer(context),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _logo() {
  return Center(
    child: Container(
      width: 280,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/eac.png')),
          SizedBox(height: 20),
          Text('Registro', style: TextStyle(fontSize: 20))
        ],
      ),
    ),
  );
}

Widget _correo() {
  TextEditingController email = TextEditingController();
  return Container(
    padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
    margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5)
        ]),
    child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent),
            labelText: 'Correo'),
        controller: email),
  );
}

Widget _password() {
  TextEditingController password = TextEditingController();
  return Container(
      padding: EdgeInsets.only(top: 10.0, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        autocorrect: false,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
          labelText: 'Contraseña',
        ),
        controller: password,
      ));
}

Widget _codigoVerificacion() {
  return Container(
      padding: EdgeInsets.only(top: 10.0, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(Icons.verified, color: Colors.blueAccent),
          labelText: 'Codigo de verificacion',
        ),
      ));
}

Widget _guardar() {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future register() async {
    // var url = "http://192.168.1.101/flutter-login-signup/register.php";

    var url =
        Uri.parse("https://192.168.100.174/conexion_ejemplo/registro.php");
    var response = await http.patch(url, body: {
      "users_email": email.text,
      "users_password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Text('User allready exit!',
          style: TextStyle(fontSize: 25, color: Colors.red));
    } else {
      Text('Registration Successful',
          style: TextStyle(fontSize: 25, color: Colors.green));
    }
  }

  return ElevatedButton(
      onPressed: () {
        register();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
        child: Text('Crear Cuenta'),
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 0.0,
          primary: Colors.blue.shade800));
}

Widget _footer(BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        Text('Ya tienes una cuenta',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          child: Text('Ingresa Ahora',
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        )
      ],
    ),
  );
}
