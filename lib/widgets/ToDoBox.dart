import 'package:flutter/material.dart';
import 'package:sample/model/todo.dart';

class ToDoBox extends StatelessWidget {
  final Todo todo;
  const ToDoBox({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.white,
        leading: 
        Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank, 
        color: Colors.blue,
        ),

        title: Text(todo.todoText!,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          decoration: todo.isDone? TextDecoration.lineThrough : null,  // If u want to make the text over a line we can use this widget

        ),
        
        ),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            
          color:Colors.red,
          borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 15,
            onPressed: (){
              // If we need to check the click button was work or not
              print('Clicked on delete!');
              } , 
            icon: Icon(Icons.delete)),
        ),
      ),
      
    );
  }
}