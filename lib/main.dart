import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/moduls/presentation/controller/bloc.dart';

import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/color_manager.dart';
import 'moduls/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();
  ServiceLocator().init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<PlayersBloc>()..getUsers())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: ColorManager.textColor),
                color: ColorManager.primary,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark))),
        home: const HomeScreen(),
      ),
    );
  }
}
