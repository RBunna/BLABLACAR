import 'package:blabla/ui/screens/ride_pref/widgets/ride_pref_form.dart';
// import 'package:blabla/ui/theme/theme.dart';
// import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: RidePrefForm(),
        ),
      ),
    ),
  );
}
