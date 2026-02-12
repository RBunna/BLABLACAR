import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: BlaButton(
              'data',
              onPressed: () {},
              buttonHierarchy: BlaButton.secondary,
              icon: Icons.chair,
            ),
          ),
        ),
      ),
    ),
  );
}
