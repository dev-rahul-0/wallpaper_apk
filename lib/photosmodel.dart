class PhotoModel {
  String imgSrc;
  String PhotoName;

  PhotoModel({required this.PhotoName, required this.imgSrc});
static PhotoModel fromApi2App(Map<String, dynamic> photoMap){
  return PhotoModel(PhotoName: photoMap["photographer"], imgSrc: (photoMap["src"])["portrait"]);
}
}
