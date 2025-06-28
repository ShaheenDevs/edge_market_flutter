class KycModel {
  final int id;
  final String selfieImage;
  final String documentImage;
  final String documentType;
  final String status;
  final String paymentId;

  KycModel({
    required this.id,
    required this.selfieImage,
    required this.documentImage,
    required this.documentType,
    required this.status,
    required this.paymentId,
  });

  factory KycModel.fromJson(Map<String, dynamic> json) => KycModel(
        id: json['id'],
        selfieImage: json['selfieImage'],
        documentImage: json['documentImage'],
        documentType: json['documentType'],
        status: json['status'],
        paymentId: json['paymentId'],
      );
}
