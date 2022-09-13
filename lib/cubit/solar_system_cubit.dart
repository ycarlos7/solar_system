import 'package:bloc/bloc.dart';
import 'package:solar_system/cubit/solar_system_state.dart';
import '../model/solar_system_model.dart';
import '../repository/solar_system_repository.dart';

class SolarSystemCubit extends Cubit<SolarSystemState> {
  final SolarSystemRepository solarSystemRepository;
  SolarSystemCubit(this.solarSystemRepository) : super(SolarSystemInitial());

  Future<void> getSolarSystem(String id) async {
    try {
      emit(SolarSystemLoading());
      SolarSystemModel _solarSystemModel =
          await solarSystemRepository.getPlanets(id);
      emit(SolarSystemLoaded(solarSystemModel: _solarSystemModel));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }
}
