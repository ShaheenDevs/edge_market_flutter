
// kyc_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KycService {
  Future<bool> createKYC({
    required File selfie,
    required File document,
    required String documentType,
    required int paymentId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var request = http.MultipartRequest('POST', Uri.parse(Endpoints.kyc));
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(await http.MultipartFile.fromPath('selfieImage', selfie.path));
    request.files.add(await http.MultipartFile.fromPath('documentImage', document.path));
    request.fields['documentType'] = documentType;
    request.fields['paymentId'] = paymentId.toString();

    var response = await request.send();
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<List<KycModel>> getAllKYCs() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final res = await http.get(Uri.parse(Endpoints.kyc), headers: {
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => KycModel.fromJson(e)).toList();
    }
    return [];
  }
}
