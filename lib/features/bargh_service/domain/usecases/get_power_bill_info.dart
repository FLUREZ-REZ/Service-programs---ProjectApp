import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/features/bargh_service/domain/entities/power_bill.dart';
import 'package:weatherapp/features/bargh_service/domain/repositories/bill_repository.dart';

class GetPowerBillInfo {
  final BillRepository repository;

  GetPowerBillInfo(this.repository);

  Future<Either<Failure, PowerBill>> call(String billID) {
    return repository.getPowerBillInfo(billID);
  }
}
