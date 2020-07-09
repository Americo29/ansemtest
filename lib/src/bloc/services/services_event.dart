part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class ServicesEventGetServices extends ServicesEvent {}
