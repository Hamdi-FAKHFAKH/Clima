void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String? res = await task2();
  task3(res);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String?> task2() async {
  String? result;
  //sleep(Duration(seconds: 3));
  await Future.delayed(Duration(seconds: 3), () {
    result = 'Task 2 complete'; // methode asynchrone executer aprés 3 seconde
    print('Task 2 complete');
  });
  return result;
}

void task3(String? res) {
  String result = 'task 3 data';
  print('Task 3 complete after $res');
}
