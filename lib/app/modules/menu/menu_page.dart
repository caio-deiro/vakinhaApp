import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './menu_controller.dart';

class MenuPage extends GetView<MenuController> {
    
    const MenuPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('MenuPage'),),
            body: Container(),
        );
    }
}