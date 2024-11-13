import 'package:flutter/material.dart';

class Task {
  String title;
  bool status;

  Task(this.title, this.status);
}

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List<Task> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Init of basic tasks
    setState(() {
      tasks.add(Task("Comprar pollo en la tienda", false));
      tasks.add(Task("Comprar pan en la tienda", true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Lista de tareas"),
            Divider(),
            TextField(
              decoration: InputDecoration(
                labelText: "Introduzca nueva tarea",
              ),
              onSubmitted: (value) {
                if (value != '') {
                  setState(() {
                    tasks.add(Task(value, false));
                    value = '';
                  });
                }
              },
            ),
            Expanded(
                child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(
                      tasks[index].title,
                      style: TextStyle(
                          decoration: tasks[index].status
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    Checkbox(
                        value: tasks[index].status,
                        onChanged: (bool? value) {
                          setState(() {
                            tasks[index].status = value!;
                          });
                        }),
                    GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    )
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
