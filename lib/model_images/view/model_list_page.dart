import 'package:flutter/material.dart';

import 'model_image_list.dart';

class ModelListPage extends StatelessWidget {
  const ModelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: const Text("Model List"),
      ),
      body:const _ModelListView(),
    );
  }
}



class _ModelListView extends StatefulWidget {
  const _ModelListView({Key? key}) : super(key: key);

  @override
  _ModelListViewState createState() => _ModelListViewState();
}

class _ModelListViewState extends State<_ModelListView> {
  List<String> modelNames = [
    "Fire",
    "Mask",
    "Weapon"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: modelNames.length,

        itemBuilder: (context , index) {
          return Card(
              elevation: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(64, 75, 96, .9)),
                child: customListTile(modelNames[index],
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => ModelImageListPage(modelName : modelNames[index])));
                  }
                ),
              )
          );
        }
        );
  }



  Widget customListTile(String name ,{ var onTap}) {
    return ListTile(
      onTap: onTap,
        contentPadding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding:const EdgeInsets.only(right: 12.0),
          decoration:const BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: Colors.white24))),
          child:const Icon(Icons.autorenew, color: Colors.white),
        ),
        title:Text(
          name.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children:const <Widget>[
            Icon(Icons.model_training, color: Colors.yellowAccent),

          ],
        ),
        trailing:
       const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }


}






