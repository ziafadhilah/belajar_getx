// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print

import 'package:http/http.dart' as http;

const urlBase = 'http://192.168.100.25:8000/api/note';

class Request {
  late final String url;
  late final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> get() {
    print(urlBase + url);
    return http.get(Uri.parse(urlBase + url)).timeout(Duration(minutes: 2));
  }

  Future<http.Response> post() {
    return http
        .post(Uri.parse(urlBase + url), body: body)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> patch() {
    return http
        .patch(Uri.parse(urlBase + url), body: body)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete() {
    return http
        .delete(Uri.parse(urlBase + url), body: body)
        .timeout(Duration(minutes: 2));
  }
}
