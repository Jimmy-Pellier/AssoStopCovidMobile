import 'dart:io';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:assostopcovidmobile/models/IModel.dart';

class Dao<T extends IModel, U extends IModel> {
  Dio dio;
  T factory;
  Dao(T factory) {
    this.factory = factory;

    dio = new Dio();

    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    //--- A dégager pour la mise en prod                                        ---//
    //--- En attendant de trouver une solution pour les certificats auto-signés --//

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
       // if (host == "192.168.1.13" || host == "173.249.55.124") {
          // Verify the certificate
          return true;
      //  }
      //  return false;
      };
    };
    //-------------------------------------------------------------------------------------//

    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      //--- Lecture du token JWT (Keycloak) ---//
      var tokenJwt = await storage.read(key: jwtToken_Key);
      dio.interceptors.requestLock.lock();

      if (tokenJwt != null) options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $tokenJwt'});

      dio.interceptors.requestLock.unlock();
      return options;
    }));
  }

  Future<Response> getList(String url, List<T> lst) async {
    Response response;
    try {
      response = await dio.get(url);

      for (final x in response.data) {
        T t = factory.fromJson(x);

        lst.add(t);
      }
    } on DioError catch (e) {
      if(e.response != null)
        response = e.response;
      else
      {
        response = new Response();
        response.statusCode = HttpStatus.requestTimeout;
      }
    }
    return response;
  }

  Future<Response> get(String url, T data) async {
    Response response;
    try {
      response = await dio.get(url);
      data.fromJson(response.data);
    } on DioError catch (e) {
      if(e.response != null)
        response = e.response;
      else
        {
          response = new Response();
          response.statusCode = HttpStatus.requestTimeout;
        }
    }
    return response;
  }

  Future<Response> post(String url, T body, U res) async {
    Response response;
    try {

      response = await dio.post(url, data: body);
      res.fromJson(response.data);
    } on DioError catch (e) {
      if(e.response != null)
        response = e.response;
      else
      {
        response = Response(statusCode: HttpStatus.requestTimeout);
      }
    }
    return response;
  }

  Future<Response> put(String url, T body, U res) async {
    Response response;
    try {
      response = await dio.put(url, data: body);
      if (res != null) res.fromJson(response.data);
    } on DioError catch (e) {
      if(e.response != null)
        response = e.response;
      else
      {
        response = new Response();
        response.statusCode = HttpStatus.requestTimeout;
      }
    }
    return response;
  }
}
