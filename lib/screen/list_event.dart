import 'package:flutter/material.dart';
import 'package:remind/controller/event.dart';
import 'package:remind/models/event.dart';
import 'package:remind/screen/add_event.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({ Key? key }) : super(key: key);

  @override
  _ListEventState createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  List<EventRespons> _eventData = [];

  @override
  void initState() {
    super.initState();
    _getEventData();
  }

  void _getEventData() async {
    try{
      var eventData = await events();
      setState(() {
        _eventData = eventData;
      });
    } catch (e) {
      print(e);
    }
  }

  void _createEvent() async {
    try{
      var test = Event("gogo", "tesr");
      await insertEvent(test);
    } catch (e){
      print(e);
    }
  }

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
          Navigator.pushNamed(context, '/add');
          // _createEvent();
          // _getEventData();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: _eventData.length,
            itemBuilder: (BuildContext context, int index) {
              final event = _eventData[index];
              return Dismissible(
                key: UniqueKey(), 
                onDismissed: (direction) {
                  setState(() {
                    deleteEvent(event.id);
                    _eventData.removeAt(index);
                  });
                },
                child: Container(
                  height: 50,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      Text(event.id.toString()),
                      Text(event.name),
                      Text(event.time),
                    ],
                  ),
                )
              );
            },
          ),
      );
  }
}