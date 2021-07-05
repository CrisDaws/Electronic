import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarPage extends StatefulWidget {
  const ListarPage({ Key? key }) : super(key: key);

  @override
  _ListarPageState createState() => _ListarPageState();
}

class _ListarPageState extends State<ListarPage> {

  final url = "http://localhost/estadia/getData.php";

  var _postJson = [];

  void fetchPosts() async {
    
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
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
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, 'devices'); }, icon: Icon(Icons.arrow_back_sharp)),),
        body: ListView.builder(
          itemCount: _postJson.length,
          itemBuilder: (context, i) {
            final post = _postJson[i];
            // return Text("Alias: ${post["devices_alias"]}");
            return Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text("Dispositivo: ${post["devices_alias"]}"),
                subtitle: Text("Numero de Serie: ${post["devices_serie"]}"),
                trailing: Icon(Icons.more_vert),
              ),
            );
          }
        ),
      ),
    );
  }
}