import 'dart:io';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.face_outlined),
              ),
              accountName: Text("Felisberto"), 
              accountEmail: Text("FerreiraChumbo1@gmail.com"),
              ),
            ListTile(
              leading: const Icon(Icons.face),
              title: const Text("Perfil"),
              subtitle: const Text("Administrador"),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Sair"),
              subtitle: const Text("Terminar Sessão"),
              onTap: (){
                exit(0);
              },
            ),
          ],
        ),
      ), 
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.panorama),
            title: const Text("Felisberto"),
            subtitle: const Text("Uma grande pessoa"),
            onTap: (){
              setState(() {
                
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
             builder: (context){
               return AlertDialog(
                 title: const Text("Nova Tarefa"),
                 content: Form(
                   key: form,
                   child: Container(
                     height: MediaQuery.of(context).size.height/3,
                     child: Column(
                       children: [
                         TextFormField(
                           validator: (value){
                             if(value!.isEmpty){
                               return "Campo Obrigatório";
                             }
                             return null;
                           },
                           decoration: const InputDecoration(
                             labelText: "escreva",
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                             ),
                             ),
                           ),
                       ],
                     ),
                   ),
                 ),
                 actions: [
                       FlatButton(onPressed: ()=> Navigator.of(context).pop(), 
                       color: Colors.red,
                       child: const Text("Cancelar",style: TextStyle(color: Colors.white),)
                        ),
                     
                   Container(
                     color: Colors.green,
                     child: TextButton(onPressed: (){
                       if(form.currentState!.validate());
                     }, 
                     child: const Text("Salvar",style: TextStyle(color:Colors.white,),
                     ),
                     ),
                   ),
                 ]
               );
             },
             );
        },
        child: const Icon(Icons.add),
      ), 
    );
  }
}
