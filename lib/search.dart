
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper/apioperation.dart';
import 'package:wallpaper/custumappbar.dart';
import 'package:wallpaper/photosmodel.dart';
import 'package:wallpaper/seacrvhbar.dart';


class SeachScreen extends StatefulWidget {
  String query;
  SeachScreen ({super.key,required this.query});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {

    List<PhotoModel> searchResults = [];

  GetSearchResults() async{
    searchResults = await ApiOPerations.searchWallpaper(widget.query);
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    GetSearchResults();
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
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SearchBarr(), ),
            SizedBox(height:10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),

              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,

                  ),
                  itemCount: searchResults.length,
                  itemBuilder: (context , index)=>Container(
                    height: 800,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(searchResults[index].imgSrc,
                        height: 800,
                        width: 50,
                        fit: BoxFit.cover,),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
