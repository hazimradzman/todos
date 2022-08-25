import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';
import 'package:todos/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //[] List/Array
  //{} Map => Key value data type
  var todos = [{
    "name":"Learn Listview",
    "place":"Training room",
    "description":"Learn listview, listtile, etc"
  },
    {
      "name":"Tea / Dinner",
      "place":"Nuin Cafe",
      "description":"Specialize teh tarik"
    },
    {
      "name":"Chapter 2 & 3",
      "place":"Home",
      "description":"Data type and OOP"
    },
    {
      "name":"Video record",
      "place":"Home",                         //todos index
      "decription":"Record video for app"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To do app'),actions: [
        IconButton(onPressed: () async{
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>AddPage())
          );
          todos.add(newItem);
          final prefs = await SharedPreferences.getInstance();
          //jsonEncode will transform list of map to string
          // because sharedPreferences can only store string,boolean & int
          //the first todos is the filename
          prefs.setString("todos", jsonEncode(todos));
          setState(() {
            todos;
          });
        },
          icon: Icon(Icons.add)
        )
      ],),
      body: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: todos.length,
    itemBuilder: (BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(todos[index]["name"]!),
        subtitle: Text(todos[index]["place"]!),
        trailing: Icon(Icons.chevron_right),
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> DetailPage(item: todos[index],))
          );
        },
      ),
    );
    }
    ),
    );
  }
}
