import 'dart:io';
import 'package:assostopcovidmobile/models/UserAuth.dart';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:assostopcovidmobile/models/IModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Dao<T extends IModel, U extends IModel> {
  Dio dio;
  T factory;


  Dao(T factory) {
    this.factory = factory;

    initDio();

  }

  initDio()
  {
    dio = new Dio();

    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;



    //--- A dégager pour la mise en prod                                        ---//
    //--- En attendant de trouver une solution pour les certificats auto-signés --//

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
        if (host == "192.168.1.13") {
          // Verify the certificate
          return true;
        }
        return false;
      };
    };
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {

      var tokenJwt = await storage.read(key: jwtToken_Key);


      dio.interceptors.requestLock.lock();

      if (tokenJwt != null)
        options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $tokenJwt'});

      options.headers.addAll({HttpHeaders.contentTypeHeader : 'application/json'});

      dio.interceptors.requestLock.unlock();

      return options;
    },

    onError: (DioError errors) async
        {
          if(errors.request.path != (DotEnv().env['BackEnd_Url'] + "/user/api/usermobile/refresh-token") &&
              errors.response.statusCode == 401) {
            await refreshToken();
            return _retry(errors.request);
          }
        }

    ));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return this.dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> refreshToken() async
  {
    var tokenRefresh = await storage.read(key: jwtRefreshToken_Key);

    var body = new UserAuth();

    var resObject = {"token": tokenRefresh};

    await storage.write(key: jwtToken_Key, value: "");
    await storage.write(key: jwtRefreshToken_Key, value: "");
    await storage.write(key: userId_Key, value: "");

    var response =  await dio.post(DotEnv().env['BackEnd_Url'] + "/user/api/usermobile/refresh-token", data: resObject);
    if(response.statusCode == 200) {
      var user = body.fromJson(response.data);
      await storage.write(key: jwtToken_Key, value: user.token);
      await storage.write(key: jwtRefreshToken_Key, value: user.refreshToken);
      await storage.write(key: userId_Key, value: user.id.toString());
    }
    else
    {
      // Déconnexion
    }

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
      if(e.response != null) {

        response = e.response;
      }
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
      if(e.response != null) {
          response = e.response;
      }
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
