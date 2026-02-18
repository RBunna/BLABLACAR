import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class BlaLocationPicker extends StatefulWidget {
  const BlaLocationPicker({super.key});

  @override
  State<BlaLocationPicker> createState() => _BlaLocationPickerState();
}

class _BlaLocationPickerState extends State<BlaLocationPicker> {
  final TextEditingController searchController = TextEditingController();

  void updateState() {
    setState(() {});
  }

  void clearController(TextEditingController c) {
    c.text = '';
    updateState();
  }

  void onTileTap(Location pickedLocation) {
    Navigator.pop(context, pickedLocation);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> locationWidgets = [];
    List<Location> locations = fakeLocations
        .where(
          (loc) => loc.name.toLowerCase().startsWith(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();

    for (var location in locations) {
      locationWidgets.addAll([
        ListTile(
          title: Text(
            location.name,
            style: BlaTextStyles.body.copyWith(
              color: BlaColors.textNormal,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            location.country.name,
            style: BlaTextStyles.body.copyWith(color: BlaColors.greyLight),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_sharp,
            color: BlaColors.neutralLight,
            size: BlaSpacings.s,
          ),
          onTap: () => onTileTap(location),
        ),
        BlaDivider(),
      ]);
    }

    return Scaffold(
      backgroundColor: BlaColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: BlaSpacings.m),
        child: Column(
          spacing: BlaSpacings.s,
          children: [
            Container(
              decoration: BoxDecoration(
                color: BlaColors.backgroundAccent,
                borderRadius: BorderRadius.circular(BlaSpacings.radius),
              ),
              child: Row(
                spacing: 8,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      cursorColor: BlaColors.primary,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search',
                        hintStyle: BlaTextStyles.body.copyWith(
                          color: BlaColors.neutralLighter,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                      ),
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.textNormal,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      onChanged: (value) => updateState(),
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    IconButton(
                      onPressed: () => clearController(searchController),
                      icon: Icon(Icons.close),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(spacing: 8, children: locationWidgets),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
