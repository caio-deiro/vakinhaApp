import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/modules/menu/widget/product_tile.dart';
import './menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return RefreshIndicator(
        onRefresh: () => controller.refreshPage(),
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (BuildContext context, int index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          },
        ),
      );
    }));
  }
}
