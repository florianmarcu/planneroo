enum TaskType { 
  Reminder,
  Goal,
}

class Task {
  String title;
  String content;
  TaskType type;

  Task({this.title,this.content,this.type});
}