import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper/apioperation.dart';
import 'package:wallpaper/custumappbar.dart';
import 'package:wallpaper/photosmodel.dart';


class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;

  CategoryScreen({super.key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotoModel> categoryResult;
  bool isLoading = true;

  getCatWall() async {
    categoryResult = await ApiOPerations.searchWallpaper(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCatWall();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const customAppBar(),
      ),
      body: SingleChildScrollView(
        child: isLoading ? Center(
          child: CircularProgressIndicator(),
        ) : Column(
          children: [
        
            Stack(
                children: [ Image.network(
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    fit: BoxFit.cover,
                    widget.catImgUrl),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.black38,
                    ),
                  ),
                  Positioned(
                    left: 120,
                    top: 40,
                    child: Column(
                      children: [
                        Text("Category", style: TextStyle(fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                        Text(widget.catName, style: TextStyle(fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )
                ]
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
        
              height:660,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
        
                  ),
                  itemCount: categoryResult.length,
                  itemBuilder: (context, index) =>
                      InkWell(
                        onTap: (){
        
                        },
                        child: Hero(
                          tag: categoryResult[index].imgSrc,
                          child: Container(
                            height: 500,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                categoryResult[index].imgSrc,
                                height: 800,
                                width: 50,
                                fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
