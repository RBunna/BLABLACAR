import 'dart:math';

import 'ride_preferences_repository.dart';
import '../../../model/ride_pref/ride_pref.dart';

class RidePreferencesRepositoryMock implements RidePreferencesRepository {
  final List<RidePreference> _pastPreferences = [];

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    await _simulateDelay();
    return _pastPreferences;
  }

  @override
  Future<void> savePreference(RidePreference preference) async {
    await _simulateDelay();
    _pastPreferences.add(preference);
  }

  Future<void> _simulateDelay() async {
    await Future.delayed(Duration(milliseconds: 200 + Random().nextInt(400)));
  }
}
