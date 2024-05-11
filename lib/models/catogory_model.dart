import 'dart:ui';

class CatogoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CatogoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CatogoryModel> getCatogories() {
    List<CatogoryModel> Catogories = [];

    Catogories.add(CatogoryModel(
        name: 'Salad',
        iconPath: 'assets/icon/salad-svgrepo-com.svg',
        boxColor: Color(0xff92A3FD))
    );
    Catogories.add(CatogoryModel(
        name: 'Cake',
        iconPath: 'assets/icon/cake-svgrepo-com.svg',
        boxColor: Color(0xffC58BF2))
    );

    Catogories.add(CatogoryModel(
        name: 'Pie',
        iconPath: 'assets/icon/cake-turkey-svgrepo-com.svg',
        boxColor: Color(0xff92A3FD))
    );

    Catogories.add(CatogoryModel(
        name: 'Smoothie',
        iconPath: 'assets/icon/orange-juice-svgrepo-com.svg',
        boxColor: Color(0xffC58BF2))
    );


    return Catogories;
  }
}
