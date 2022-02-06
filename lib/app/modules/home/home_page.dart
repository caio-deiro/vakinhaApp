import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/appbar_widget.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {},
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.exit_to_app,
              ),
              label: 'Sair'),
        ],
      ),
      body: Container(),
    );
  }
}
