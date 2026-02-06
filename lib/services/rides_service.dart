import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides, Location departure) {
    return rides.where((ride) => ride.departureLocation == departure).toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(
    List<Ride> rides,
    int requestedSeat,
  ) {
    return rides.where((ride) => ride.remainingSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    // return availableRides.where((ride) {
    //   bool available = false;
    //   if (departure != null && departure == ride.departureLocation) {
    //     available = true;
    //   } else if (departure == null) {
    //     available = true;
    //   }
    //   if (seatRequested != null && seatRequested <= ride.remainingSeats) {
    //     available = available && true;
    //   } else if (seatRequested == null) {
    //     available = available && true;
    //   }
    //   return available;
    // }).toList();

    List<Ride> found = [];
    if (departure != null) {
      found = _filterByDeparture(availableRides, departure);
    }
    if (seatRequested != null) {
      found.addAll(_filterBySeatRequested(availableRides, seatRequested));
    }

    return found;
  }
}
