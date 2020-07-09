import 'package:ansemtest/src/pages/pages.dart';
import 'package:ansemtest/src/repositories/services_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ansemtest/src/bloc/blocs.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final servicesRepository = ServicesRepository();

  runApp(BlocProvider(
    create: (context) => ServicesBloc(servicesRepository: servicesRepository)
      ..add(ServicesEventGetServices()),
    child: MyApp(servicesRepository: servicesRepository),
  ));
}

class MyApp extends StatelessWidget {
  final ServicesRepository servicesRepository;

  MyApp({Key key, @required this.servicesRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryIconTheme: IconThemeData(color: Colors.white),
          primaryColor: Color.fromRGBO(
              255, 87, 34, 1.0), //Color.fromRGBO(255, 193, 7, 1.0),
          primaryColorDark: Color.fromRGBO(255, 160, 0, 1.0),
          primaryColorLight: Color.fromRGBO(255, 236, 179, 1.0),
          accentColor: Color.fromRGBO(255, 193, 7, 1.0),
          errorColor: Color.fromRGBO(255, 87, 34, 1.0),
          appBarTheme: AppBarTheme(color: Color.fromRGBO(236, 239, 241, 1.0)),
          iconTheme: IconThemeData()),
    );
  }
}
