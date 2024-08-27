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
        title: const Text('Subah',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          //decoration: TextDecoration.lineThrough,   // If u want to make the text over a line we can use this widget
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
              
              } , 
            icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}