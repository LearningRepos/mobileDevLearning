class Task {
  final String name;
  bool isDone = false;

  Task(this.name, this.isDone);

  void toggleDone() {
    isDone = !isDone;
  }
}
