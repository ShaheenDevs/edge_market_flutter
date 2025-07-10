// api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  String? token;

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Map<String, String> get _headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
        if (token != null) HttpHeaders.authorizationHeader: 'Bearer $token'
      };

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    return await http.post(Uri.parse(Endpoints.baseUrl + url),
        headers: _headers, body: jsonEncode(body));
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    return await http.put(Uri.parse(Endpoints.baseUrl + url),
        headers: _headers, body: jsonEncode(body));
  }

  Future<http.Response> get(String url) async {
    if (token == null) {
      await getToken();
    }
    return await http.get(Uri.parse(Endpoints.baseUrl + url),
        headers: _headers);
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(Uri.parse(Endpoints.baseUrl + url),
        headers: _headers);
  }

  Future<http.StreamedResponse> uploadKyc({
    required File selfieImage,
    required File documentImage,
    required File paymentProof,
    required String documentType,
    required String payment,
    required String userId,
  }) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse(Endpoints.baseUrl + Endpoints.kyc));
    if (token != null) {
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    request.fields['documentType'] = documentType;
    request.fields['payment'] = payment;
    request.fields['userId'] = userId;
    request.files.add(await http.MultipartFile.fromPath(
        'selfieImage', selfieImage.path,
        contentType: MediaType('image', 'jpeg')));

    request.files.add(await http.MultipartFile.fromPath(
        'documentImage', documentImage.path,
        contentType: MediaType('image', 'jpeg')));
    request.files.add(await http.MultipartFile.fromPath(
        'paymentProofImage', paymentProof.path,
        contentType: MediaType('image', 'jpeg')));

    return await request.send();
  }
}
