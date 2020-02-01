class Task {
  final int id;
  final String task;

  Task({this.id, this.task});

  Task.fromDB(Map<String, dynamic> map)
      : id = map['id'],
        task = map['task'];

  Map<String, dynamic> toMapForDB() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['task'] = task;
    return map;
  }
}
