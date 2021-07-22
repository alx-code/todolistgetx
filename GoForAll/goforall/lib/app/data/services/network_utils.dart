import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart';

 
class NetworkUtils {
  String baseUrl;
  String path;
  Map<String, String> headers; 
  dynamic body; 
  
  NetworkUtils({Key? key, required this.baseUrl, required this.path, required this.headers, required this.body });
  Client client = Client();

  Future<dynamic> fetchRequest() async {
    var responseJson;
    try{
      var url = Uri.parse('$baseUrl$path'); 
      final response = await client.get(url)
                                   .timeout(const Duration(seconds: 120));
       responseJson = json.decode(response.body);
    }catch(ex){
      throw ex;
    } 
    return responseJson;
  }

  Future<dynamic> putRequest() async {
    var responseJson;
    try{
      var url = Uri.parse('$baseUrl$path'); 
      final response = await client.put(url, body: body)
                                   .timeout(const Duration(seconds: 120));
       responseJson = json.decode(response.body.toString());
    }catch(ex){
      throw ex;
    } 
    return responseJson;
  }
}