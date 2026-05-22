import 'package:get_it/get_it.dart';
import 'package:weatherapp/features/bargh_service/data/datasources/bill_remote_datasource.dart';
import 'package:weatherapp/features/bargh_service/data/repositories/bill_repository_impl.dart';
import 'package:weatherapp/features/bargh_service/domain/repositories/bill_repository.dart';
import 'package:weatherapp/features/bargh_service/domain/usecases/get_power_bill_info.dart';
import 'package:weatherapp/features/bargh_service/presentation/provider/bill_provider.dart';



final sl = GetIt.instance;

Future<void> initDependencies() async {
  const baseUrl = 'https://s.api.ir/api/sw1/PowerBillInfo';
  const token = 'Bearer rj+2/hRiUEKACj/GlIoJDx4yumjZdVtIeDUVbMvhVsxR3FWtIvr2+jlGYLaF0LdFDchvJAK+rF4hJlAgPw8Lll0qPvvvUcHCfiN/DrMa8Dk=';

  sl.registerLazySingleton<BillRemoteDatasource>(
        () => BillRemoteDatasourceImpl(baseUrl: baseUrl, token: token),
  );

  sl.registerLazySingleton<BillRepository>(
        () => BillRepositoryImpl(sl<BillRemoteDatasource>()),
  );

  sl.registerLazySingleton<GetPowerBillInfo>(
        () => GetPowerBillInfo(sl<BillRepository>()),
  );

  sl.registerFactory<BillProvider>(
        () => BillProvider(sl<GetPowerBillInfo>()),
  );
}
