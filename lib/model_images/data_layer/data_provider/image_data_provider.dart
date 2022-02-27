
import 'package:http/http.dart' as http;



class ImageDataProvider
{
  final String base_Url = "https://fypsmartcomputing.herokuapp.com/upload?status=Pending&select=labelFile&modelName=";
  //Fire


  Future<http.Response> getImages(String type)async
  {
    print("HELLO");
    http.Response rawData = await http.get(Uri.parse(base_Url+type));
    return rawData;
  }


}