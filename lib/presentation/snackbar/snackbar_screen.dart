import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){},),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar( snackbar );
  }

  void openDialog(  BuildContext context ) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: const Text('Eiusmod pariatur nisi nulla do cupidatat dolor ea aute. Labore anim veniam in occaecat minim. Amet labore ut eu sint aliqua sunt dolor reprehenderit nulla. Quis laborum adipisicing dolore cillum minim proident dolor adipisicing laboris commodo est consequat. Eu et esse eiusmod amet ut et occaecat anim.'),
        actions: [
          TextButton( onPressed: () => context.pop(), child: const Text('Cancelar')),

          FilledButton( onPressed: () => Navigator.of(context).pop(), child: const Text('Aceptar')),
        ]
      ) 
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(
                context: context,
                children: [
                  const Text('In nostrud ullamco occaecat mollit incididunt. Aliquip amet do consequat ea duis. Aute cupidatat adipisicing excepteur mollit exercitation veniam aliqua mollit mollit. Lorem minim labore eiusmod cillum duis culpa quis sint deserunt officia nostrud do. Minim ad cillum dolore sit.')
                ]
              );
            }, child: const Text('Licencias usadas')),

            FilledButton.tonal(onPressed: () => openDialog(context),
            child: const Text('Mostrar diálogo'))
          ]
        )
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.arrow_upward_outlined ),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}
