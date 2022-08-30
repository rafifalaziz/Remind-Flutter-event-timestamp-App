class Event {
  final String name;
  final String time;

  const Event(
    this.name,
    this.time,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'Event{name: $name, time: $time}';
  }

}