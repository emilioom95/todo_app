import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/home_screen.dart';
import 'package:todo_app/presentation/screens/todo_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':                                                              //ruta principal
        return MaterialPageRoute(builder: (_) => HomeScreen());              //ruta homescreen
      case '/todo':                                                          //ruta alternativa
        return MaterialPageRoute(builder: (_) => TodoScreen());               //ruta de la app
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Ruta no encontrada')),          //scafold que muestra ruta fallida en caso de no encontrarse el archivo
                ));
    }
  }
}
