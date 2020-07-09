part of 'services_bloc.dart';

@immutable
abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesStateLoadInProgress extends ServicesState {}

class ServicesStateLoadSuccess extends ServicesState {
  final Services services;

  ServicesStateLoadSuccess({this.services});

  @override
  List<Object> get props => [services];

  @override
  String toString() => 'ServicesStateLoadSuccess {}';
}

class ServicesStateLoadFailure extends ServicesState {}
