import 'package:flutter/material.dart';
import 'package:wallpaper/apioperation.dart';
import 'package:wallpaper/category_model.dart';
import 'package:wallpaper/custumappbar.dart';
import 'package:wallpaper/photosmodel.dart';
import 'package:wallpaper/seacrvhbar.dart';

import 'catBlock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> trendingWallList = [];

  List<CategoryModel> catModList = [];
  bool isLoading = true;

  GetCatDetails() async {
    catModList = await ApiOPerations.getCategoriesList();
    print("Getting Cat Mod List");
    print(catModList);
    setState(() {
      catModList = catModList;
    });
  }

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOPerations.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpapers();
    GetCatDetails();
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
      body: isLoading ? Center(child: CircularProgressIndicator(),):
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SearchBarr(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingWallList.length,
                      itemBuilder: ((context, index) => CatVlock(
                            categoryImgSrc: catModList[index].catImgUrl,
                            categoryName: catModList[index].catName,
                          )))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 680,
              child: RefreshIndicator(
                onRefresh: () async{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: trendingWallList.length,
                    itemBuilder: (context, index) => Container(
                          height: 800,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                height: 800,
                                width: 50,
                                fit: BoxFit.cover,
                                trendingWallList[index].imgSrc),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
