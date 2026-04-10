import 'package:blabla/main_common.dart';
import 'package:provider/provider.dart';

import 'data/repositories/locations/locations_repository.dart';
import 'data/repositories/locations/locations_repository_mock.dart';
import 'data/repositories/ride_preferences/ride_preferences_repository.dart';
import 'data/repositories/ride_preferences/ride_preferences_repository_mock.dart';
import 'data/repositories/rides/rides_repository.dart';
import 'data/repositories/rides/rides_repository_mock.dart';
import 'ui/states/ride_preferences_state.dart';

List<InheritedProvider> get devProviders {
  final RidePreferencesRepository ridePreferencesRepository =
      RidePreferencesRepositoryMock();
  return [
    Provider<LocationsRepository>(create: (_) => LocationsRepositoryMock()),
    Provider<RidesRepository>(create: (_) => RidesRepositoryMock()),
    Provider<RidePreferencesRepository>(
      create: (_) => ridePreferencesRepository,
    ),
    ChangeNotifierProvider(
      create: (_) => RidePreferencesState(ridePreferencesRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
