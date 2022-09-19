// todo item model for the Todo List
class TodoModel {
  // todo item's title
  late String title;

  // todo item's description
  late String description;

  // getter for the todo item's title
  String get getTitle => title;

  // setter for the todo item's title
  set setTitle(String title) => this.title = title;

  // setter for the todo item's description
  set setDescription(String description) => this.description = description;

  // getter for the todo item's description
  String get getDescription => description;

  // todo item's due date
  final DateTime? dueData;

  // todo item's status
  late Status status;

  // Constructor for the Todo
  TodoModel({
    required this.title,
    required this.description,
    this.dueData,
    required this.status,
  });

  // Function to update the status of a todo item in the list of todo items in the state
  void handleTodoChange() {
    if (status.type == Status.pending.type) {
      status = Status.done;
    } else {
      status = Status.pending;
    }
  }
}

class Status {
  // The status of the todo
  String type;

  // Constructor for the Status
  Status(this.type);

  // The status of the todo item
  static Status done = Status('Done');
  static Status pending = Status('Pending');
}