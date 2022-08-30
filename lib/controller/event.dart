import 'package:remind/models/db.dart';
import 'package:remind/models/event.dart';
import 'package:sqflite/sqflite.dart';

class EventRespons extends Event {
  final int id;
  const EventRespons(this.id, String name, String time) : super(name, time);
}

Future<void> insertEvent(Event event) async {
  final db = await connectDB();
  await db.insert(
    'events',
    event.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteEvent(int idEvent) async {
  final db = await connectDB();
  await db.delete(
    'events',
    where: 'id = ?',
    whereArgs: [idEvent],
  );
}

Future<List<EventRespons>> events() async {
    final db = await connectDB();
    final List<Map<String, dynamic>> maps = await db.query('events');
    return List.generate(maps.length, (i) {
      return EventRespons(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['time'],
      );
    });
  }