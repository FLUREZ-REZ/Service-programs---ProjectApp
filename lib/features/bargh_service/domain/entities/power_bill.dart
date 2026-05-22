class PowerBill {
  final String billID;
  final String payID;
  final String date;
  final int amount;
  final PowerBillInfo? info;

  PowerBill({
    required this.billID,
    required this.payID,
    required this.date,
    required this.amount,
    required this.info,
  });
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
}
