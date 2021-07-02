import 'package:flutter/material.dart';

class DispositivosPage extends StatefulWidget {
  const DispositivosPage({ Key? key }) : super(key: key);

  @override
  _DispositivosPageState createState() => _DispositivosPageState();
}

class _DispositivosPageState extends State<DispositivosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(56, 98, 124, 1),
      appBar: AppBar(
        title: Text('Dispositivos'),
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
        )
              ),
              Center(
                
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text(
                    'Alias',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(label: Text(
                    'No. Serie',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(label: Text(
                    'Editar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Focos Sala')),
                    DataCell(Text('283020339302')),  
                    DataCell(
                      TextButton(onPressed: (){},child: Icon(Icons.edit)),
                    ), 
                     
                  ])
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}