import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(                                          //imagen de bienvenida
              'assets/logo.png',                                   //ruta de la imagen
              width: 300,                                          //dimensiones de la imagen
              height: 300,                                        //dimensiones
              fit: BoxFit.cover,                                  //como se coloca la imagen dentro del box
            ),
            SizedBox(height: 20),
            Text(                                                //texto de bienvenida
              'Bienvenido a Todo App',
              style: TextStyle(                                  //formato del texto
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Examen Final de Programación Móvil 2\n'
              'José Emilio Oyervide M\n'
              'Agosto - 2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(                                       //boton de ingreso a la app de tareas
              onPressed: () {
                Navigator.pushNamed(context, '/todo');            //config del boton
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Ir a la aplicación'),                 //texto del boton
            ),
          ],
        ),
      ),
    );
  }
}
