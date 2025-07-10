import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:edge_market/app/app.locator.dart';

class KycService {
  final ApiService _apiService = locator<ApiService>();
  final AuthService _authService = locator<AuthService>();

  Future<KycModel?> uploadKyc({
    required File selfieImage,
    required File documentImage,
    required File paymentProof,
    required String documentType,
    required String payment,
  }) async {
    try {
      final response = await _apiService.uploadKyc(
        selfieImage: selfieImage,
        documentImage: documentImage,
        documentType: documentType,
        paymentProof: paymentProof,
        payment: payment,
        userId: "${_authService.user?.id}",
      );

      final res = await http.Response.fromStream(response);

      if (res.statusCode == 201) {
        final json = jsonDecode(res.body)['data'];
        return KycModel.fromJson(json["kyc"]);
      } else {
        final body = jsonDecode(res.body);
        log("❌ Upload KYC failed: ${res.statusCode} - ${body['message'] ?? res.reasonPhrase}");
      }
    } catch (e, stack) {
      log("🚨 Exception in uploadKyc: $e", stackTrace: stack);
    }
    return null;
  }

  Future<List<KycModel>> getAllKycs() async {
    try {
      final res = await _apiService.get(Endpoints.kyc);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['data'] as List;
        return data.map((e) => KycModel.fromJson(e)).toList();
      } else {
        log("❌ getAllKycs failed: ${res.statusCode} - ${res.body}");
      }
    } catch (e, stack) {
      log("🚨 Exception in getAllKycs: $e", stackTrace: stack);
    }
    return [];
  }

  Future<KycModel?> getKycById(int id) async {
    try {
      final res = await _apiService.get('${Endpoints.kyc}/$id');
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['data'];
        return KycModel.fromJson(data);
      } else {
        log("❌ getKycById failed: ${res.statusCode} - ${res.body}");
      }
    } catch (e, stack) {
      log("🚨 Exception in getKycById: $e", stackTrace: stack);
    }
    return null;
  }

  Future<bool> updateKycStatus({
    required int id,
    required String status,
  }) async {
    try {
      final res = await _apiService.put('${Endpoints.kyc}/$id', {
        'status': status,
      });

      if (res.statusCode == 200) {
        return true;
      } else {
        log("❌ updateKycStatus failed: ${res.statusCode} - ${res.body}");
      }
    } catch (e, stack) {
      log("🚨 Exception in updateKycStatus: $e", stackTrace: stack);
    }
    return false;
  }

  Future<bool> deleteKyc(int id) async {
    try {
      final res = await _apiService.delete('${Endpoints.kyc}/$id');
      if (res.statusCode == 200) {
        return true;
      } else {
        log("❌ deleteKyc failed: ${res.statusCode} - ${res.body}");
      }
    } catch (e, stack) {
      log("🚨 Exception in deleteKyc: $e", stackTrace: stack);
    }
    return false;
  }
}
