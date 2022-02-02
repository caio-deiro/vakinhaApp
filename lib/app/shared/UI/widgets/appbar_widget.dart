import 'package:flutter/material.dart';

class AppbarWidget extends AppBar {
  final double? elevation;
  AppbarWidget({
    Key? key,
    this.elevation = 0,
  }) : super(
          toolbarHeight: 80,
          iconTheme: IconThemeData(
            color: Color(0xFF007D21),
          ),
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 85,
          ),
        );
}
