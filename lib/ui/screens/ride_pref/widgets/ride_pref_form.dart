import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departureDate = DateTime.now();
    requestedSeats = 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  Text _titleEnable(String name) => Text(
    name,
    style: BlaTextStyles.button.copyWith(color: BlaColors.textNormal),
  );
  Text _titleLight(String name) => Text(
    name,
    style: BlaTextStyles.button.copyWith(color: BlaColors.textLight),
  );
  Text get departureTitle => departure != null
      ? _titleEnable(departure!.name)
      : _titleLight('Leaving from');
  Text get arrivalTitle =>
      arrival != null ? _titleEnable(arrival!.name) : _titleLight('Going to');
  Text get date => _titleEnable(DateTimeUtils.formatDateTime(departureDate));
  Text get seat => _titleEnable(requestedSeats.toString());

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Icon(Icons.circle_outlined),
                title: departureTitle,
              ),
            ),
            if (departure != null || arrival != null) IconButton(onPressed: () {}, icon: Icon(Icons.swap_vert_outlined, color: BlaColors.primary,)),
          ],
        ),
        BlaDivider(),
        ListTile(leading: Icon(Icons.circle_outlined), title: arrivalTitle),
        BlaDivider(),
        ListTile(leading: Icon(Icons.calendar_month_outlined), title: date),
        BlaDivider(),
        ListTile(leading: Icon(Icons.person_outline), title: seat),
        Container(
          decoration: BoxDecoration(
            color: BlaColors.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: ListTile(
            title: Center(
              child: Text('Search', style: TextStyle(color: BlaColors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
