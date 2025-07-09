import 'dart:convert';
import 'package:edge_market/models/payment.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class PaymentMethodService {
  final ApiService _apiService = ApiService();

  Future<List<PaymentMethod>> getAllMethods() async {
    final response = await _apiService.get(Endpoints.paymentMethods);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List list = data['data'];
      return list.map((e) => PaymentMethod.fromJson(e)).toList();
    } else {
      throw Exception(data['message']);
    }
  }

  Future<PaymentMethod> getMethodById(int id) async {
    final response = await _apiService.get('${Endpoints.paymentMethods}/$id');
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PaymentMethod.fromJson(data['data']);
    } else {
      throw Exception(data['message']);
    }
  }

  Future<void> createMethod(PaymentMethod method) async {
    final response = await _apiService.post(
      Endpoints.paymentMethods,
      method.toJson(),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode != 201) {
      throw Exception(data['message']);
    }
  }

  Future<void> updateMethod(int id, PaymentMethod method) async {
    final response = await _apiService.put(
      '${Endpoints.paymentMethods}/$id',
      method.toJson(),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['message']);
    }
  }

  Future<void> deleteMethod(int id) async {
    final response =
        await _apiService.delete('${Endpoints.paymentMethods}/$id');
    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['message']);
    }
  }
}
