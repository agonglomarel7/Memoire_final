import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class RequestAssistant {
  static String url = "https://myschool.herokuapp.com/api/";
  static Dio dio = Dio();

  getRequest(String path, String authorization) async {
    var response = await dio.get(url + path,
        options: Options(
          contentType: 'application/json',
          headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
        }
        ));
        try {
          if (response.statusCode == 200) {
            print(response.data.runtimeType);
            return json.decode(json.encode(response.data));
          } else {
            return {
              "success": false,
              "message": "Requête Echouée"
            };
          }
        } catch (e, s) {
          print("$e, $s");
          return {
              "success": false,
              "message": "Une erreur est survenue"
            };
        }
    
  }


  postRequest(String path, String authorization, dynamic data) async {
    final response = await dio.post(url + path,
        options: Options(
          contentType: 'application/json',
          headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
          'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        }
        ),
        data: data,
        );
        try {
          if (response.statusCode == 200) {
            return response.data;
          } else {
            return {
              "success": false,
              "message": "Requête Echouée"
            };
          }
        } catch (e, s) {
          print("$e, $s");
          return {
              "success": false,
              "message": "Une erreur est survenue"
            };
        }
    
  }

    putRequest(String path, String authorization, dynamic data) async {
    final response = await dio.put(url + path,
        options: Options(
          contentType: 'application/json',
          headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
          'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        }
        ),
        data: data,
        );
        try {
          if (response.statusCode == 200) {
            return response.data;
          } else {
            return {
              "success": false,
              "message": "Requête Echouée"
            };
          }
        } catch (e, s) {
          print("$e, $s");
          return {
              "success": false,
              "message": "Une erreur est survenue"
            };
        }
    
  }

  deleteRequest(String path, String authorization) async {
    var response = await dio.delete(url + path,
        options: Options(
          contentType: 'application/json',
          headers: {
          'Accept': '*/*',
          'Authorization': authorization,
          'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        }
        ));
        try {
          if (response.statusCode == 200) {
            response = json.decode(response.data);
            print(response);
            return response;
          } else {
            return {
              "success": false,
              "message": "Requête Echouée"
            };
          }
        } catch (e, s) {
          print("$e, $s");
          return {
              "success": false,
              "message": "Une erreur est survenue"
            };
        }
    
  }


  Future<dynamic> httpGetRequest(String path, String authorization) async {
    http.Response response = await http.get(Uri.parse(url+path),headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
        });

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        var decodeData = jsonDecode(jSonData);
        print("monde decode est là");
        print(decodeData);
        return decodeData;
      } else {        
        print("mon code decode n'est pas là");
        return "failed";
      }
    } catch (exp) {
      print("monde decode n'est pas là. voici l'exception $exp");
      return "failed";
    }
  }

  
  Future<dynamic> httpPostRequest(String path, String authorization, dynamic data) async {
    http.Response response = await http.post(Uri.parse(url+path),headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
        }, body: data );

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        var decodeData = jsonDecode(jSonData);
        return decodeData;
      } else {
        return "failed";
      }
    } catch (exp) {
      return "failed";
    }
  }


}
