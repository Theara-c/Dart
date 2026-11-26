import 'package:flutter/material.dart';
import 'package:my_project/data/profile_data.dart';
import 'package:my_project/ui/screens/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(data: ronanProfile),
  ));
}
