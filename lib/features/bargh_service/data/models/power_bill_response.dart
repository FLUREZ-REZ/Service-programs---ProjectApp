class PowerBillResponse {
  final PowerBillData? data;
  final bool success;
  final int code;
  final String? error;
  final String? message;

  PowerBillResponse({
    this.data,
    required this.success,
    required this.code,
    this.error,
    this.message,
  });

  factory PowerBillResponse.fromJson(Map<String, dynamic> json) {
    return PowerBillResponse(
      data: json['data'] != null
          ? PowerBillData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      success: json['success'] as bool? ?? false,
      code: json['code'] as int? ?? 0,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }
}

class PowerBillData {
  final PowerBillInfo? info;
  final String? print;
  final int amount;
  final String billID;
  final String payID;
  final String date;

  PowerBillData({
    this.info,
    this.print,
    required this.amount,
    required this.billID,
    required this.payID,
    required this.date,
  });

  factory PowerBillData.fromJson(Map<String, dynamic> json) {
    return PowerBillData(
      info: json['info'] != null
          ? PowerBillInfo.fromJson(json['info'] as Map<String, dynamic>)
          : null,
      print: json['print'] as String?,
      amount: json['amount'] as int? ?? 0,
      billID: json['billID'] as String? ?? '',
      payID: json['payID'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );
  }
}

class PowerBillInfo {
  final String ownerName;
  final String address;
  final String postalCode;
  final String usageType;
  final String meterNumber;
  final String fileNumber;
  final String city;
  final int capacity;
  final String previousReadDate;
  final String currentReadDate;
  final int currentConsumption;
  final int previousNumber;
  final int currentNumber;

  PowerBillInfo({
    required this.ownerName,
    required this.address,
    required this.postalCode,
    required this.usageType,
    required this.meterNumber,
    required this.fileNumber,
    required this.city,
    required this.capacity,
    required this.previousReadDate,
    required this.currentReadDate,
    required this.currentConsumption,
    required this.previousNumber,
    required this.currentNumber,
  });

  factory PowerBillInfo.fromJson(Map<String, dynamic> json) {
    return PowerBillInfo(
      ownerName: json['ownerName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      usageType: json['usageType'] as String? ?? '',
      meterNumber: json['meterNumber'] as String? ?? '',
      fileNumber: json['fileNumber'] as String? ?? '',
      city: json['city'] as String? ?? '',
      capacity: json['capacity'] as int? ?? 0,
      previousReadDate: json['previousReadDate'] as String? ?? '',
      currentReadDate: json['currentReadDate'] as String? ?? '',
      currentConsumption: json['currentConsumption'] as int? ?? 0,
      previousNumber: json['previousNumber'] as int? ?? 0,
      currentNumber: json['currentNumber'] as int? ?? 0,
    );
  }
}
