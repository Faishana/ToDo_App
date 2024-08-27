class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<Todo> todoList(){
    return [
      Todo(id: '01', todoText: 'Subah prayer', isDone: true),
      Todo(id: '02', todoText: 'Get breakfast', isDone: true),
      Todo(id: '03', todoText: 'Ready recap the lecture notes', ),
      Todo(id: '04', todoText: 'Pray Luhar', isDone: true),
      Todo(id: '05', todoText: 'Get Lunch',),
      Todo(id: '06', todoText: 'Learn somethings related to industry', isDone: true),
      Todo(id: '07', todoText: 'Pray Asr', isDone: true),
      Todo(id: '08', todoText: 'Play some games', ),
      Todo(id: '09', todoText: 'Pray Mahrib', isDone: true),
    ];
  }
}