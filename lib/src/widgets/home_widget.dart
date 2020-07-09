import 'package:ansemtest/src/bloc/blocs.dart';
import 'package:ansemtest/src/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Servicios activos',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                height: screenHeight * 0.90,
                child: loadServices(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadServices(BuildContext context) {
    return BlocListener<ServicesBloc, ServicesState>(
      listener: (context, state) {},
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          return state is ServicesStateLoadSuccess
              ? activeServices(context, state.services)
              : state is ServicesStateLoadInProgress
                  ? loadingServices()
                  : state is ServicesStateLoadFailure
                      ? failureServices()
                      : Scaffold(body: Container());
        },
      ),
    );
  }

  Widget activeServices(BuildContext context, Services services) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: services.items.length,
      itemBuilder: (BuildContext context, int index) {
        final user = services.items[index].user;
        final vehicle = services.items[index].vehicle;
        return Container(
          width: screenWidth * 0.70,
          height: screenHeight * 0.19,
          child: Card(
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.03),
                Icon(
                  Icons.directions_car,
                  size: screenHeight * 0.08,
                ),
                SizedBox(width: screenWidth * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${vehicle.brand} - ${vehicle.model} - ${vehicle.colour}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      vehicle.licensePlate,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loadingServices() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text('Cargando servicios...'),
      ],
    );
  }

  Widget failureServices() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text('No se cargaron los servicios, posible error de red!'),
      ],
    );
  }
}
