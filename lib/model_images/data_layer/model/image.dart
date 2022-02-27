


class ModelImage
{
  String id;
  String labelFile;



  ModelImage({required this.id ,required this.labelFile});


  factory ModelImage.fromJson(Map<String, dynamic> json)=>ModelImage(
      id: json["_id"],
      labelFile: json["labelFile"],
  );









}