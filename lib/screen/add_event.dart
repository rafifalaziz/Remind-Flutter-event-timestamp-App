import 'package:flutter/material.dart';
import 'package:remind/controller/event.dart';
import 'package:remind/models/event.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({ Key? key }) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  void _addEvent() async {
    try{
      var time = new DateTime.now();
      await insertEvent(Event(_eventController.text, time.toString()));
      Navigator.pushNamed(context, '/');
    }catch(e){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Event"),
        leading: BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name"),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
            controller: _eventController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ) 
                ),
            ),
          ),
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: _addEvent,
              child: Text("add"),
            ),
          )
        ],
      ),
    );
  }
}