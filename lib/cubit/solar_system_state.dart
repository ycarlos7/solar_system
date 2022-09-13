import 'package:flutter/cupertino.dart';

import '../model/solar_system_model.dart';

@immutable
abstract class SolarSystemState {}

class SolarSystemInitial extends SolarSystemState {}

class SolarSystemLoading extends SolarSystemState {}

class SolarSystemLoaded extends SolarSystemState {
  late final SolarSystemModel? solarSystemModel;
  SolarSystemLoaded({this.solarSystemModel});
}

class SolarSystemError extends SolarSystemState {
  final String error;
  SolarSystemError(this.error);
}
