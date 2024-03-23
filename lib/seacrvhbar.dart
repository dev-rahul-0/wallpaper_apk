import 'package:flutter/material.dart';
import 'package:wallpaper/search.dart';
class SearchBarr extends StatelessWidget {
    SearchBarr({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 192, 192, 192),
          border: Border.all(color:const Color.fromARGB(33, 45, 55, 66)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
            Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder:   InputBorder.none,
                focusedBorder:  InputBorder.none,
                disabledBorder:  InputBorder.none,
                enabledBorder:  InputBorder.none,
                border:        InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SeachScreen(query: _searchController.text,)));
            },
            child: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
