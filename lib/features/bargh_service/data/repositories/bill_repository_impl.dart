

import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/features/bargh_service/data/datasources/bill_remote_datasource.dart';
import 'package:weatherapp/features/bargh_service/domain/entities/power_bill.dart';
import 'package:weatherapp/features/bargh_service/domain/repositories/bill_repository.dart';

class BillRepositoryImpl implements BillRepository {
  final BillRemoteDatasource remoteDatasource;

  BillRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, PowerBill>> getPowerBillInfo(String billID) async {
    try {
      final response = await remoteDatasource.fetchPowerBillInfo(billID);

      // نکته: طبق پاسخ شما success=false یعنی باید Failure برگردانیم
      if (!response.success) {
        final msg = response.message ?? response.error ?? 'درخواست ناموفق است.';
        return left(ServerFailure(msg));
      }

      final data = response.data;
      if (data == null) {
        return left(ServerFailure('دیتای خالی برگشت داده شد.'));
      }

      final infoModel = data.info;

      final entity = PowerBill(
        billID: data.billID,
        payID: data.payID,
        date: data.date,
        amount: data.amount,
        info: infoModel == null
            ? null
            : PowerBillInfo(
          ownerName: infoModel.ownerName,
          address: infoModel.address,
          postalCode: infoModel.postalCode,
          usageType: infoModel.usageType,
          meterNumber: infoModel.meterNumber,
          fileNumber: infoModel.fileNumber,
          city: infoModel.city,
          capacity: infoModel.capacity,
          previousReadDate: infoModel.previousReadDate,
          currentReadDate: infoModel.currentReadDate,
          currentConsumption: infoModel.currentConsumption,
          previousNumber: infoModel.previousNumber,
          currentNumber: infoModel.currentNumber,
        ),
      );

      return right(entity);
    } catch (e) {
      return left(ServerFailure('خطای شبکه/سرور: $e'));
    }
  }
}
