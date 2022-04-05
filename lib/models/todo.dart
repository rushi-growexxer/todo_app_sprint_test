class Todo {
  String text;
  String? description;
  bool done;

  Todo({required this.text, this.description, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(text: json['text'], done: json['done']);

  Map<String, dynamic> toJson() => {'text': text, 'done': done};
}
