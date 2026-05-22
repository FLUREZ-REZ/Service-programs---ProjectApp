import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/features/bargh_service/domain/entities/power_bill.dart';

abstract class BillRepository {
  Future<Either<Failure, PowerBill>> getPowerBillInfo(String billID);
}
