import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DispositivosPage extends StatefulWidget {
  const DispositivosPage({ Key? key }) : super(key: key);

  @override
  _DispositivosPageState createState() => _DispositivosPageState();
}

class _DispositivosPageState extends State<DispositivosPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController alias, serie;

    @override
  void initState() {
    super.initState();
    alias = new TextEditingController();
    serie = new TextEditingController();
    fetchPosts();
  }

  Future addDevice() async {
    var url = Uri.parse("https://ioteacenter.ga/registro_dispositivo.php");
    var data = { "devices_alias": alias.text, "devices_serie": serie.text };
    var res = await http.post(url, body: data);

    print(res);

    if(res.body == "Error") {
      Text("Algo salio mal", style: TextStyle(fontSize: 25, color: Colors.red));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
      Text('Algo salio mal' ,textAlign: TextAlign.center)));
    } else {
      Text('Dispositivo Agregado Correctamente',
      style: TextStyle(fontSize: 25, color: Colors.green),);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
      Text('Dispositivo agregado', textAlign: TextAlign.center,)));
    }
  }

  void fetchPosts() async {

    final url = "https://ioteacenter.ga/getData.php";
    // ignore: unused_local_variable
    var _postJson = [];

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        title: Text('Dispositivos',),
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, 'dash'); }, icon: Icon(Icons.arrow_back_sharp)),
        actions: [
          
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            key: _formKey,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: <BoxShadow> [
                        BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  offset: Offset(0, 5),
                                  blurRadius: 5)
                      ]
                    ),
                    child: TextFormField(
              validator: (valor) {
                              if (valor!.isEmpty) {
                                return 'Numero de serie Vacio';
                              }
                              return null;
                            },
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(Icons.
                app_registration_rounded, size: 30.0, color: Colors.blueAccent),
                labelText: 'Numero de Serie'
              ),
              controller: serie
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: <BoxShadow> [
                         BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  offset: Offset(0, 5),
                                  blurRadius: 5)
                      ]
                    ),
                    child: TextFormField(
                      validator: (valor) {
                              if (valor!.isEmpty) {
                                return 'Alias Vacio';
                              }
                              return null;
                            },
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(Icons.ad_units_outlined, size: 30.0, color: Colors.blueAccent),
                labelText: 'Alias Dispositivo'
              ),
              controller: alias,
                    )
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                            onPressed: () {
                                addDevice();
                                limpiarData();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 15.0),
                              child: Text('Agregar Dispositivo'),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                elevation: 0.0,
                                primary: Colors.blue)),
                  Center(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
  void limpiarData(){
    serie.clear();
    alias.clear();
  }
}