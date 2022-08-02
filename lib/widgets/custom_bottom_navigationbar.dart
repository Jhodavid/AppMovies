import 'package:flutter/material.dart';
import 'package:peliculas/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.screenCurrentIndex;

    return BottomNavigationBar(
        onTap: ( index ) => uiProvider.screenCurrentIndex = index,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon( Icons.favorite_border_outlined),
              label: 'Favoritas'
          ),
          BottomNavigationBarItem(
              icon: Icon( Icons.add),
              label: 'Otras'
          ),
        ]
    );
  }
}
