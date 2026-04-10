import 'package:flutter/material.dart';

import '../../data/repositories/ride_preferences/ride_preferences_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferencesRepository _ridePreferencesRepository;
  final int maxAllowedSeats = 8;
  RidePreference? _selectedRidePreference;

  RidePreferencesState(this._ridePreferencesRepository);

  RidePreference? get selectedRidePreference => _selectedRidePreference;

  Future<void> selectPreference(RidePreference preference) async {
    if (preference != _selectedRidePreference) {
      _selectedRidePreference = preference;

      await _ridePreferencesRepository.savePreference(preference);
    }
  }
}
