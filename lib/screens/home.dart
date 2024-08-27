import 'package:flutter/material.dart';
import '../constance/colour.dart';
import '../widgets/ToDoBox.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBar_Clr,
      appBar: appbar_creation(),
      body: Container(
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
                  ToDoBox(),
                ],
              ),
            )
          ],
        )
      ),
    );
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