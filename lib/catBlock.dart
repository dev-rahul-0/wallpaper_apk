
import 'package:flutter/material.dart';
import 'package:wallpaper/category.dart';

class CatVlock extends StatelessWidget {
  String categoryName;
  String categoryImgSrc;
    CatVlock({super.key,required this.categoryImgSrc,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(catImgUrl: categoryImgSrc, catName: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                categoryImgSrc),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          ),
            Positioned(
                left: 35,
                top: 15,
              child: Text(categoryName,style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.w600
              ),))
        ]),
      ),
    );
  }
}
