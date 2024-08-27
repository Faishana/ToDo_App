import 'package:flutter/material.dart';

class ToDoBox extends StatelessWidget {
  const ToDoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: const Icon(Icons.check_box, 
        color: Colors.blue,
        ),
      ),
    );
  }
}