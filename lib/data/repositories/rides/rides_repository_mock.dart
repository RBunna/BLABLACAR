import 'dart:math';

import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../dummy_data.dart';
import 'rides_repository.dart';

class RidesRepositoryMock implements RidesRepository {
  final List<Ride> _rides = fakeRides;

  @override
  Future<List<Ride>> getRides() async {
    await _simulateDelay();
    return _rides;
  }

  @override
  Future<List<Ride>> findRides(RidePreference preference) async {
    await _simulateDelay();
    return _rides
        .where(
          (ride) =>
              ride.departureLocation.name == preference.departure.name &&
              ride.arrivalLocation.name == preference.arrival.name &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }

  Future<void> _simulateDelay() async {
    await Future.delayed(Duration(milliseconds: 500 + Random().nextInt(1000)));
  }
}
