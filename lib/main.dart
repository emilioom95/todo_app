import 'package:flutter/material.dart';
import 'package:todo_app/config/routers/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',             //titulo para la aplicacion
      theme: ThemeData(                     //control de tema
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: AppRouter.generateRoute,   //uso de router
      initialRoute: '/',                          //ruta principal
      debugShowCheckedModeBanner: false,          //remocion de banner de debug
    );
  }
}
