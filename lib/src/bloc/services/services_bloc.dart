import 'dart:async';

import 'package:ansemtest/src/models/services_model.dart';
import 'package:ansemtest/src/repositories/services_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesRepository servicesRepository;

  ServicesBloc({this.servicesRepository});

  @override
  ServicesState get initialState => ServicesInitial();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if (event is ServicesEventGetServices) {
      yield ServicesStateLoadInProgress();
      try {
        final resp = await servicesRepository.getServices();
        if (resp.ok) {
          if (resp.services["status"] == 200) {
            final services = Services.fromJsonList(resp.services["services"]);
            yield ServicesStateLoadSuccess(services: services);
          }
        } else {
          yield ServicesStateLoadFailure();
          print('Error al obtener servicios: ${resp.message}');
        }
      } catch (e) {
        yield ServicesStateLoadFailure();
        print('Error en ServicesEventGetServices: ${e.toString()}');
      }
    }
  }
}
