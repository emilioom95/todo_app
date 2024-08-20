class TodoState {                           //clase del estado de la tarea
  final String title;                       //string del titulo
  bool isComplete;                          //booleano del estado

  TodoState({                               //paquete incluye titulo y estado
    required this.title,
    this.isComplete = false,                //siempre como no completado
  });
}
