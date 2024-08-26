import 'package:flutter/material.dart';
import 'package:sample/constance/colour.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBar_Clr,
      appBar: appbar_creation(),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            search_box(),
          ],
        )
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container search_box() {
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