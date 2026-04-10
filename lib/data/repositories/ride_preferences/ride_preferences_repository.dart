import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferencesRepository {
  Future<List<RidePreference>> getPastPreferences();
  Future<void> savePreference(RidePreference preference);
}
