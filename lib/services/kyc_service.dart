import 'dart:convert';
import 'dart:io';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;

class KycService {
  final ApiService _apiService = locator<ApiService>();

  /// Uploads KYC documents using ApiService's `uploadKyc`
  Future<bool> createKYC({
    required File selfie,
    required File document,
    required String documentType,
    required int paymentId,
  }) async {
    final response = await _apiService.uploadKyc(
      selfieImage: selfie,
      documentImage: document,
      documentType: documentType,
      paymentId: paymentId.toString(),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }

  /// Fetches all KYC records
  Future<List<KycModel>> getAllKYCs() async {
    final http.Response res = await _apiService.get(Endpoints.kyc);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => KycModel.fromJson(e)).toList();
    }

    return [];
  }
}
