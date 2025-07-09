import 'dart:convert';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class WalletService {
  final ApiService _api = ApiService();

  Future<bool> depositWallet({
    required int userId,
    required double amount,
    String? description,
  }) async {
    final response = await _api.post(Endpoints.walletDeposit, {
      "userId": userId,
      "amount": amount,
      "description": description ?? "Flutter deposit"
    });

    return response.statusCode == 200;
  }

  Future<bool> requestWithdrawal({
    required int userId,
    required double amount,
    String? description,
  }) async {
    final response = await _api.post(Endpoints.walletWithdraw, {
      "userId": userId,
      "amount": amount,
      "description": description ?? "Flutter withdrawal"
    });

    return response.statusCode == 200;
  }

  Future<bool> approveWithdrawal(int transactionId) async {
    final response = await _api.post(
      Endpoints.walletApprove + transactionId.toString(),
      {},
    );
    return response.statusCode == 200;
  }

  Future<bool> rejectWithdrawal(int transactionId) async {
    final response = await _api.post(
      Endpoints.walletReject + transactionId.toString(),
      {},
    );
    return response.statusCode == 200;
  }

  Future<List<Map<String, dynamic>>> getUserTransactions(int userId) async {
    final response =
        await _api.get(Endpoints.walletTransactions + userId.toString());

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['transactions']);
    } else {
      return [];
    }
  }
}
