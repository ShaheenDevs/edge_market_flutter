class KycModel {
  final int id;
  final String selfieImage;
  final String documentImage;
  final String documentType;
  final String paymentId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  KycModel({
    required this.id,
    required this.selfieImage,
    required this.documentImage,
    required this.documentType,
    required this.paymentId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KycModel.fromJson(Map<String, dynamic> json) {
    return KycModel(
      id: json['id'],
      selfieImage: json['selfieImage'],
      documentImage: json['documentImage'],
      documentType: json['documentType'],
      paymentId: json['paymentId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'selfieImage': selfieImage,
      'documentImage': documentImage,
      'documentType': documentType,
      'paymentId': paymentId,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
