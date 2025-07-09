class PaymentMethod {
  final int id;
  final String accountName;
  final String accountNumber;
  final String accountOwner;
  final String methodType;
  final bool status;

  PaymentMethod({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.accountOwner,
    required this.methodType,
    required this.status,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      accountName: json['accountName'],
      accountNumber: json['accountNumber'],
      accountOwner: json['accountOwner'],
      methodType: json['methodType'],
      status: json['status'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountName': accountName,
      'accountNumber': accountNumber,
      'accountOwner': accountOwner,
      'methodType': methodType,
      'status': status,
    };
  }
}
