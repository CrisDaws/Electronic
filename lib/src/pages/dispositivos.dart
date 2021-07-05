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
  

  late TextEditingController alias, serie;

    @override
  void initState() {
    super.initState();
    alias = new TextEditingController();
    serie = new TextEditingController();
    fetchPosts();
  }

  Future addDevice() async {
    var url = Uri.parse("http://localhost/estadia/registro_dispositivo.php");
    var data = { "devices_alias": alias.text, "devices_serie": serie.text };
    var res = await http.post(url, body: data);

    print(res);

    if(res.body == "Error") {
      Text("Algo salio mal", style: TextStyle(fontSize: 25, color: Colors.red));
    } else {
      Text('Dispositivo Agregado Correctamente',
      style: TextStyle(fontSize: 25, color: Colors.green),);
    }
  }


  void fetchPosts() async {

    final url = "http://localhost/estadia/getData.php";
    var _postJson = [];

    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }

  
//  Future<List> getData() async {
//    var url = Uri.parse("http://localhost/estadia/getData.php");
//   final response = await http.get(url);
//   return json.decode(response.body);
//   }
  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: Color.fromRGBO(56, 98, 124, 1),
      appBar: AppBar(
        title: Text('Dispositivos'),
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, 'dash'); }, icon: Icon(Icons.arrow_back_sharp)),
        actions: [
          
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      offset: Offset(0,5),
                      color: Colors.blue.shade400,
                      blurRadius: 1
                    )
                  ]
                ),
                child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.arrow_forward_sharp, color: Colors.blueAccent),
            labelText: 'Numero de Serie'
          ),
          controller: serie
        )
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      offset: Offset(0,5),
                      color: Colors.blue.shade400,
                      blurRadius: 1
                    )
                  ]
                ),
                child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.arrow_forward_sharp, color: Colors.blueAccent),
            labelText: 'Alias Dispositivo'
          ),
          controller: alias,
        )
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                        onPressed: () {
                          addDevice();
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
              Center(
                
              ),
              
              
              
              // DataTable(
              //   columns: [
              //     DataColumn(label: Text(
              //       'Alias',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     )),
              //     DataColumn(label: Text(
              //       'No. Serie',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     )),
              //     DataColumn(label: Text(
              //       'Editar',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     )),
                  
              //   ],
              //   rows: [
              //     DataRow(cells: [
              //       DataCell(Text('Focos Sala')),
              //       DataCell(Text('283020339302')),  
              //       DataCell(
              //         TextButton(onPressed: (){}
              //         ,child: Icon(Icons.edit)),
              //       ), 
                     
              //     ])
              //   ],
              // )
            ],
            
          )
        ),
      ),
      
    );
    
  }
  

 
}