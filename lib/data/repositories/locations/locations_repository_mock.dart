import 'dart:math';

import '../../../model/ride/locations.dart';
import '../../dummy_data.dart';
import 'locations_repository.dart';

class LocationsRepositoryMock implements LocationsRepository {
  final List<Location> _locations = fakeLocations;

  @override
  Future<List<Location>> getLocations() async {
    await _simulateDelay();
    return _locations;
  }

  Future<void> _simulateDelay() async {
    final random = Random();
    await Future.delayed(Duration(milliseconds: 400 + random.nextInt(600)));
  }
}
