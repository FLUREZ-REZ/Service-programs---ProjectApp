import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weatherapp/core/di/injection.dart' hide sl;
import 'package:weatherapp/core/di/injection_theme.dart';

import 'package:weatherapp/core/theme_manager.dart';
import 'package:weatherapp/features/auth/presentation/pages/home_page.dart';

import 'core/network/api_client.dart';
import 'features/auth/data/datasource/auth_remote_datasource.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecases/send_otp.dart';
import 'features/auth/domain/usecases/verify_otp.dart';
import 'features/auth/presentation/provider/auth_provider.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await setupLocator();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  final apiClient = ApiClient(
    baseUrl: 'https://s.api.ir',
    token: 'rj+2/hRiUEKACj/GlIoJDx4yumjZdVtIeDUVbMvhVswdnw0Ffp4fOM33N0mS+dpDRMTR+cqZ3lvOMGVi9E8BmIfAMZirtiHKAX1SUjhsz9U=',
  );

  final dataSource = AuthRemoteDataSource(apiClient);
  final repo = AuthRepositoryImpl(dataSource);


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            SendOtp(repo),
            VerifyOtp(repo),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return ListenableBuilder(
        listenable: sl<ThemeManager>(),
        builder: (context , _){

          return MaterialApp(
            themeMode: sl<ThemeManager>().themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme(
                  brightness: Brightness.light,
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  secondary: Colors.amber,
                  onSecondary: Colors.black,
                  error: Colors.red,
                  onError: Colors.white,
                  primaryContainer: Colors.black38,
                  surface: Color.fromRGBO(222, 222, 222, 1),
                  onSurface: Colors.black),
                  canvasColor: Colors.black12,
                  cardColor: Colors.black12,
                  primaryColorLight: Color.fromRGBO(250, 250, 250, 1),
                  appBarTheme: AppBarTheme(
                    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  )

            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              drawerTheme: DrawerThemeData(
                backgroundColor: Color.fromRGBO(25, 30, 40, 1)
              ),

              canvasColor: Color.fromRGBO(25, 30, 40, 1),
              cardColor: Color.fromRGBO(25, 30, 40, 1),
                primaryColorLight: Color.fromRGBO(10, 10, 10, 1),
                appBarTheme: AppBarTheme(
                  backgroundColor: Color.fromRGBO(25, 30, 40, 1),
                ),


            ),
            debugShowCheckedModeBanner: false,
            locale: const Locale('fa'),
            supportedLocales: const [
              Locale('fa'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.ltr,
                child: child!,
              );
            },
//
            home: const InitialRoute(),
          );

        }
    );
  }
}

//
class InitialRoute extends StatelessWidget {
  const InitialRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Homepage();
  }
}


