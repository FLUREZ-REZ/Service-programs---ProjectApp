import 'package:flutter/cupertino.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/features/bargh_service/domain/entities/power_bill.dart';
import 'package:weatherapp/features/bargh_service/domain/usecases/get_power_bill_info.dart';

class BillProvider extends ChangeNotifier {
  final GetPowerBillInfo getPowerBillInfo;

  BillProvider(this.getPowerBillInfo);

  bool _isLoading = false;
  String? _errorMessage;
  PowerBill? _bill;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  PowerBill? get bill => _bill;

  Future<void> fetchBill(String billID) async {
    _isLoading = true;
    _errorMessage = null;
    _bill = null;
    notifyListeners();

    final result = await getPowerBillInfo(billID);

    result.fold(
          (Failure failure) {
        _errorMessage = failure.message;
      },
          (PowerBill data) {
        _bill = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
