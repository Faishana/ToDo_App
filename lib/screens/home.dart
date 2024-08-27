import 'package:flutter/material.dart';
import 'package:sample/constance/colour.dart';
import 'package:sample/model/todo.dart';
import '../widgets/ToDoBox.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBar_Clr,
      appBar: appbar_creation(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                search_box(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text('All ToDo', 
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                      for(Todo todo in todoList)
                      ToDoBox(todo: todo,),
                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 0,
                    ),
                    ],
                    borderRadius:BorderRadius.circular(10.0)
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Add new todo item',
                      border: InputBorder.none,
                    ),
                  ),
                  
                ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      elevation: 10,
                      backgroundColor: Colors.blue
                    ), 
                    child: const Text('+', style: TextStyle(fontSize: 30, color: Colors.black),),
                    onPressed: (){} ,
                    ),
                    
                ),
              ]
            ),
          )
        ],
      ),
    );
  }

  void _handleToDo(Todo todo){

  }
  // ignore: non_constant_identifier_names
  Widget search_box() {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search,
                color: menu_Clr,
                size: 25,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "search",
                
              ),
            ),


          );
  }

  AppBar appbar_creation() {
    return AppBar(
      backgroundColor: appBar_Clr,
      elevation: 0,     //Shadow has been gone
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, 
          color: menu_Clr,
          size: 30,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),  //Make the box shape into oval shape
              child: Image.asset("assets/images/Faishu1.jpeg"),
            ),
          )
        ],
      ),
    );
  }
}