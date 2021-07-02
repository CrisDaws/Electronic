import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<TestPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailctrl, passctrl;

  @override
  void initState() {
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }

  register() async {
    var url = Uri.parse("http://localhost/estadia/registro.php");
    var data = {"users_email": emailctrl.text, "users_password": passctrl.text};
    var res = await http.post(url, body: data);

    print(res);

    if (res.body == "Error") {
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
                            Text('Registro', style: TextStyle(fontSize: 20))
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
                          controller: emailctrl),
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
                          controller: passctrl,
                        )),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                            
                          }
                          // register();
                          // Navigator.pushReplacementNamed(context, 'dash');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 15.0),
                          child: Text('Crear Cuenta'),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  
}
