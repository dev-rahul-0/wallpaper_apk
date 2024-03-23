

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart'as http;
import 'package:wallpaper/photosmodel.dart';

import 'category_model.dart';
class ApiOPerations{
  static   List<PhotoModel> trendingWallpapers = [];
  static List<PhotoModel> searchWallpapers = [];
  static Future<List<PhotoModel>> getTrendingWallpapers()async{
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
    headers: {"Authorization" :"j3l45aJZMpIIZCCL1YfnhdFTK22mCP9BVqN2Hrld40B2w91pA5MqwEfz"}
    ).then((value)  {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotoModel.fromApi2App(element));
      });
    });
    return trendingWallpapers;
  }



  static Future<List<PhotoModel>> searchWallpaper(String query) async{
      await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
          headers: {"Authorization" :"j3l45aJZMpIIZCCL1YfnhdFTK22mCP9BVqN2Hrld40B2w91pA5MqwEfz"}
      ).then((value)  {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData['photos'];
        searchWallpapers.clear();
        photos.forEach((element) {
          searchWallpapers.add(PhotoModel.fromApi2App(element));
        });
      });
      return searchWallpapers;
  }




  static Future<List<CategoryModel>> getCategoriesList() async {
    List<String> categoryNameList = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];

    List<CategoryModel> categoryModelList = [];

    for (String categoryName in categoryNameList) {
      final _random = Random();

      List<PhotoModel> photosList = await searchWallpaper(categoryName);
      if (photosList.isNotEmpty) {
        int randomIndex = _random.nextInt(photosList.length);
        PhotoModel photoModel = photosList[randomIndex];
        print("IMG SRC IS HERE");
        print(photoModel.imgSrc);

        CategoryModel categoryModel =
        CategoryModel(catImgUrl: photoModel.imgSrc, catName: categoryName);
        categoryModelList.add(categoryModel);
      }
    }

    return categoryModelList;
  }
}
