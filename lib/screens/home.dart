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
  final _todoControllar = TextEditingController();
  List<Todo> _searchToDo = [];

  @override
  void initState()
  {
    _searchToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: body_Clr,
      
      appBar: appbar_creation(),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/BG1.jpg'), // Replace with your image path
      //       fit: BoxFit.cover,
      //     ),
      //     ),
          
      body : Stack(
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
                      for(Todo todo in _searchToDo.reversed)
                      ToDoBox(
                        todo: todo,
                        OnToDoChanged: _handleToDo,
                        onDeleteItem: _deleteToDo,
                        ),
                    ],
                  ),
                )
              ],
            )
          ),
          addNewItemBar(),
        ],
      ),
   // ),
    );
  }

  Align addNewItemBar() {
    return Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child: Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                child: TextField(
                  controller: _todoControllar,
                  decoration: const InputDecoration(
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
                  //  minimumSize: Size(40, 40),
                    elevation: 10,
                    backgroundColor: Colors.blue,
                  ), 
                  child: const Text('+', style: TextStyle(fontSize: 30, color: Colors.black),),
                  onPressed: (){
                    _addToDoItem(_todoControllar.text);
                  } ,
                  ),
                  
              ),
            ]
          ),
        );
  }

  void _handleToDo(Todo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDo(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDoItems){
    setState(() {
      todoList.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDoItems));
    });
    _todoControllar.clear();
  }

  void _fillterSearch(String entry){
    List<Todo> result = [];
    if(entry.isEmpty){
      result = todoList;
    }
    else{
      result = todoList.where((item) => item.todoText!.toLowerCase().contains(entry.toLowerCase())).toList();
    }

    setState(() {
      _searchToDo = result;
    });
  }

  // ignore: non_constant_identifier_names
  Widget search_box() {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: (value) => _fillterSearch(value),
              decoration: const InputDecoration(
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

  // ignore: non_constant_identifier_names
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
              child: Image.asset("assets/images/bujuk1.jpg"),
            ),
          )
        ],
      ),
    );
  }
}