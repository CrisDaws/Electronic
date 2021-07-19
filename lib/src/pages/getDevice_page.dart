import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: must_be_immutable
class ListarPage extends StatefulWidget {
  late List list;
  late int index;
  
  @override
  _ListarPageState createState() => _ListarPageState();
}

class _ListarPageState extends State<ListarPage> {

  final url = "https://ioteacenter.ga/getData.php";

  var _postJson = [];

  void fetchPosts() async {
    
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
      });
  }
  void eliminarData() {
    final uri =  "https://ioteacenter.ga/deleteData.php";
    http.post(Uri.parse(uri), body: {
      'devices_id': widget.list[widget.index]['devices_id']
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Mis dispositivos"),
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, 'dash'); }, icon: Icon(Icons.arrow_back_sharp)),),
        body: ListView.builder(
          itemCount: _postJson.length,
          itemBuilder: (context, i) {
            final post = _postJson[i];
            // return Text("Alias: ${post["devices_alias"]}");
            // Visualizacion de los datos.
            return Card(
              child: ListTile(
                leading: Text("${post["devices_id"]}"),
                title: Text("Alias: ${post["devices_alias"]}"),
                subtitle: Text("No. de Serie: ${post["devices_serie"]}"),
                trailing: IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: (){
                    confirm();
                    setState(() {});
                  },
                ) 
              ),
            );
          }
        ),
      ),
    );
  }
  void confirm() {
    // ignore: unused_local_variable
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Estas Seguro de eliminar '${widget.list[widget.index]['devices_alias']}'"),
      actions: [
        new ElevatedButton(
          child: new Text("Ok eliminado!", style: new TextStyle(color: Colors.black),),
          onPressed: (){
            eliminarData();
          },
        )
      ],
    );
  }
}