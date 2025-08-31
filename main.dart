import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  // ignore: non_constant_identifier_names
  String Title = "No Data Entered";

  List<String> tasks = [];

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List App'),
          backgroundColor: Colors.yellow[800],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'Enter task',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
            MaterialButton(
              color: Colors.lightBlue,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
                setState(() {
                  tasks.add(textController.text);
                  textController.clear();
                });
              },
              child: Text('Add Task'),
            ),
              ],
            ),

               Flexible(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(tasks[index]),
                          ),
                        ),
                        MaterialButton(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                        ),
                      ], 
                    );
                  },
                ),
              ),
           ],
        ),
      ),
    );
  }
}