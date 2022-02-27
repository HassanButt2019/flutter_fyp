


import 'dart:convert';

import 'package:flutter_fyp/model_images/data_layer/data_provider/image_data_provider.dart';
import 'package:flutter_fyp/model_images/data_layer/model/models.dart';
import 'package:http/http.dart' as http;

class ImageRepository
{
  final ImageDataProvider _provider = ImageDataProvider();

  Future<List<ModelImage>>  getImages(String type) async
  {
    print("HELLO Upcomming");
    http.Response rawData = await _provider.getImages(type);
    final json = jsonDecode(rawData.body) ;
    print(json["data"]);
    List<ModelImage> data = json["data"].map<ModelImage>((model) => ModelImage.fromJson(model)).toList();
    return data;
  }

}