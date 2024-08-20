import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {                                 //statefulwidget porq las tareas son de estado mutable
  @override
  _TodoScreenState createState() => _TodoScreenState();                     //creacion del estado
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todoList = [];                                        //lista de tareas vacia

  void _addTodoItem(String title, String description) {                     //anadir nueva tarea a la lista con metodo add
    setState(() {                                               //setear estado pues es mutable
      _todoList.add(Todo(                                      //anadir
        title: title,                                         //titulo es un string
        description: description,                             //descripcion es estring
        isCompleted: false,                                   //estado es booleano
      ));
    });
  }

  void _removeTodoItem(int index) {                     //para remover el usamos el index de la lista y el metodo remove
    setState(() {                                       //setear estado pues es mutable
      _todoList.removeAt(index);                        //eliminar
    });
  }

  void _toggleTodoCompletion(int index) {                         //cambio de estado de completitud
    setState(() {                                       //seteo de estado mutable
      _todoList[index].isCompleted = !_todoList[index].isCompleted;     //cambio de estado 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                    //container para mostrar las tareas
      appBar: AppBar(
        title: Text('Lista de Tareas', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: _todoList.isEmpty
          ? Center(
              child: Text(
                'No hay tareas aún. ¡Agrega una nueva!',            //texto para tareas vacias
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(                              //list view para mostrar la lista de tareas
              padding: EdgeInsets.all(16.0),
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return TodoItem(                                                 //mostrar las tareas 
                  todo: _todoList[index],                                       //lista de tareas
                  onRemove: () => _removeTodoItem(index),                       //eliminar tarea
                  onToggleCompletion: () => _toggleTodoCompletion(index),       //completar tarea
                );
              },
            ),
      floatingActionButton: FloatingActionButton(           //boton para agregar tareas
        onPressed: () => _showAddTodoDialog(),              //dialogo para anadir tarea
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.teal.shade50,
    );
  }

  void _showAddTodoDialog() {
    String title = '';                                                //string vacios de titulo y descripcion
    String description = '';                          

    showDialog(                                             //constructor del dialogo para anadir tareas
      context: context,
      builder: (context) {
        return AlertDialog(                                  //mostrar el cuadro de dialogo
          title: Text('Agregar nueva tarea', style: TextStyle(color: Colors.teal)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Título',
                  labelStyle: TextStyle(color: Colors.teal),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 16.0),                       //sizebox entre el campo de título y descripción para dar espacio
              TextField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  labelStyle: TextStyle(color: Colors.teal),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar', style: TextStyle(color: Colors.redAccent)),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  _addTodoItem(title, description);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}

class Todo {                        //objeto de cada tarea: titulo, descripcion y estado
  String title;
  String description;
  bool isCompleted;

  Todo({                              //implementacion de la tarea (objeto)
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}

class TodoItem extends StatelessWidget {        
  final Todo todo;                                                  //clase de tareas
  final VoidCallback onRemove;                                        //llamada a retiro
  final VoidCallback onToggleCompletion;                            //llamada a completitud

  TodoItem({                                              //todos los campos de las tareas son necesarios
    required this.todo,
    required this.onRemove,
    required this.onToggleCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: todo.isCompleted ? Colors.grey : Colors.teal.shade900,
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            todo.description,
            style: TextStyle(fontSize: 16, color: todo.isCompleted ? Colors.grey : Colors.teal.shade700),
          ),
        ),
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            onToggleCompletion();
          },
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
