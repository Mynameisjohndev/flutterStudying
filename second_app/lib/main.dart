import 'package:flutter/material.dart';
 
void main(){
 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
 
}
 
class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}
 
class _HomeStatefulState extends State<HomeStateful> {

  var _texto = "Jamilton Damasceno";
 
  @override
  Widget build(BuildContext context) {
 
    print("Build chamado");
 
    return Scaffold(
      appBar: AppBar(
        title: Text( "Instagram" ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _texto = "Curso Flutter";
                  });
                },
                child: Text("Clique aqui"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber
                ),
            ),
            Text("Nome: $_texto ")
          ],
        ),
      ),
 
    );
  }
}
 
 
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    var _titulo = "Instagram";
 
    return Scaffold(
      appBar: AppBar(
        title: Text( _titulo ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo principal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Text("Texto 1"),
              Text("Texto 1"),
            ],
          ),
        ),
      ),
    );
  }
}