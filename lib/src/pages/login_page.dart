import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String msg='';

  Future login(BuildContext context) async {
    var url = Uri.parse('http://localhost/estadia/login.php');
    var response = await http.post(url, body: {
      "users_email": email.text,
      "users_password": password.text
    });
    var data = json.decode(response.body);

    if(data.length == 0) {
      setState(() {
        msg = "Login Fallido, Intente de nuevo";
        print(msg);
        limpiarData();
        showToast();
      });
    } else {
      print("Login Exitoso");
      print(data);
       Navigator.pushReplacementNamed(context, 'dash');
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Intente de nuevo"),
    ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        width: 280,
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage('assets/eac.png')),
                            SizedBox(height: 20),
                            Text('Login', style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 5, bottom: 5, right: 20),
                      margin:
                          EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: Offset(0, 5),
                                blurRadius: 5)
                          ]),
                      child: TextFormField(
                          validator: (valor) {
                            if (valor!.isEmpty) {
                              return 'Email Vacio';
                            }
                            return null;
                          },
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.blueAccent),
                              labelText: 'Correo'),
                          controller: email),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: 10.0, left: 5, bottom: 5, right: 20),
                        margin:
                            EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  offset: Offset(0, 5),
                                  blurRadius: 5)
                            ]),
                        child: TextFormField(
                          validator: (valor) {
                            if (valor!.isEmpty) {
                              return 'Contraseña vacia';
                            }
                            return null;
                          },
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Colors.blueAccent),
                            labelText: 'Contraseña',
                          ),
                          controller: password,
                        )),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                        onPressed: () {
                         login(context);
                        //  Navigator.pop(context);
                          // register();
                          // Navigator.pushReplacementNamed(context, 'dash');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 15.0),
                          child: Text('Logearme'),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 0.0,
                            primary: Colors.blue.shade800)),
                    SizedBox(height: 20.0),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text('Crear una cuenta',
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
                              Navigator.pushReplacementNamed(context, 'test');
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

 void limpiarData() {
   email.clear();
   password.clear();
 }

  void showToast() {  
    Fluttertoast.showToast(  
        msg: 'Login Fallido, Intente de Nuevo',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white
    );  
  }
}