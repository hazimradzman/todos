import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new item"),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "Enter item name"),
          controller: nameEditingController,),

          SizedBox(height: 8,),
          TextField(decoration: InputDecoration(hintText: "Enter item description"),
          controller: descEditingController,),
          SizedBox(height: 8,),
          TextField(decoration: InputDecoration(hintText: "Enter item place"),
          controller: placeEditingController,),
          SizedBox(height: 8,),
          TextButton(onPressed: (){
            print(nameEditingController.text);
            print(descEditingController.text);
            print(placeEditingController.text);
            var newItem = {
              "name":nameEditingController.text,
              "description":descEditingController.text,
              "place":placeEditingController.text,

            };
            Navigator.pop(context, newItem);

          }, child: Text("Add new item"))

        ],
      ),

    );
  }
}
