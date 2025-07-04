import 'dart:convert';
import 'dart:io';
import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:edge_market/app/app.locator.dart';

class KycService {
  final ApiService _apiService = locator<ApiService>();

  Future<KycModel?> uploadKyc({
    required File selfieImage,
    required File documentImage,
    required String documentType,
    required String paymentId,
  }) async {
    final response = await _apiService.uploadKyc(
      selfieImage: selfieImage,
      documentImage: documentImage,
      documentType: documentType,
      paymentId: paymentId,
    );

    if (response.statusCode == 201) {
      final res = await http.Response.fromStream(response);
      final json = jsonDecode(res.body)['data'];
      return KycModel.fromJson(json);
    }

    return null;
  }

  Future<List<KycModel>> getAllKycs() async {
    final res = await _apiService.get(Endpoints.kyc);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => KycModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<KycModel?> getKycById(int id) async {
    final res = await _apiService.get('${Endpoints.kyc}/$id');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'];
      return KycModel.fromJson(data);
    }
    return null;
  }

  Future<bool> updateKycStatus({
    required int id,
    required String status,
  }) async {
    final res = await _apiService.put('${Endpoints.kyc}/$id', {
      'status': status,
    });

    return res.statusCode == 200;
  }

  Future<bool> deleteKyc(int id) async {
    final res = await _apiService.delete('${Endpoints.kyc}/$id');
    return res.statusCode == 200;
  }
}
