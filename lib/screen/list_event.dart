import 'package:flutter/material.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({ Key? key }) : super(key: key);

  @override
  _ListEventState createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Remind"),
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.undo),
            ),
            SizedBox(width: 10,),
            Expanded(child: Icon(Icons.redo)),
          ]
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/home');
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox.expand(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.3,
              color: Colors.orange,
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.3,
              color: Colors.orange,
            ),
          ],
        )
        )
      ),
    );
  }
}