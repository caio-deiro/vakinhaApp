import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app_widget.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const AppWidget());
}
