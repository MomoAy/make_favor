import 'package:flutter/material.dart';
import 'package:make_favor/views/make_favor.dart';
import 'package:make_favor/views/make_favor_allow.dart';
import 'package:make_favor/views/make_favor_ask.dart';
import 'package:make_favor/views/make_favor_refuse.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma TabBar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  Widget ask_interface =   make_favor_ask();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KOF FAVOR'),
          centerTitle: true,
          bottom: const TabBar(tabs: 
          [
            Tab(text: "Demandes",),
            Tab(text: "Acceptations",),
            Tab(text: "Refus",)
          ]
          ),
        ),
        body: TabBarView(children: [
          ask_interface,
          make_favor_allow(),
          make_favor_refuse(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MakeFavorPage())).then((value) {
              setState(() {
                ask_interface =  make_favor_ask();
              });
            });
          },
          child: const Icon(Icons.edit),
          tooltip: "Ajouter une faveur",
          ),
      ),
    );
  }
}
