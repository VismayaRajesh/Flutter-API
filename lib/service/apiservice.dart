import 'dart:convert';

import 'package:api/model/Products.dart';
import 'package:api/model/RespAllproducts.dart';
import 'package:http/http.dart'as http;
class Apiservice{

  final baseurl = "https://dummyjson.com";

  Future<List<Products>?> Getallproducts() async {
    final response = await http.get(Uri.parse("$baseurl/products")); //retrive api response from url and save it in a variable "response".
    var jsonn = jsonDecode(response.body); //decode response to json using jsondecode() function and save json data in variable json.
    if(response.statusCode>=200 && response.statusCode<=299){
      //statusCode 200-299 denotes success response, statusCode 400-499 denotes page not found. statusCode 500-599 denotes serve side issue.
      RespAllproducts resp = RespAllproducts.fromJson(jsonn); //convert json data to RespAllproducts class object.
      var plist = resp.products; //retrive list from object and sacve it on list.
      return plist;
    }
  }

}