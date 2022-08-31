import 'dart:convert';

class Task {
  final int id;
  final String taskName;
  final String taskDetail;
  final bool completed;

  const Task({
    required this.id,
    required this.taskName,
    required this.taskDetail,
    required this.completed,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: (map['id'] as num).toInt(),
      taskName: map['task_name'],
      taskDetail: map['task_detail'],
      completed: map['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_name': taskName,
      'task_detail': taskDetail,
      'completed': completed,
    };
  }

  factory Task.fromJson(String source) {
    return Task.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
