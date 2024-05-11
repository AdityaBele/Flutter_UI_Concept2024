

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewisSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewisSelected
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
        DietModel(name: 'Honey Pancake',
            iconPath: 'assets/icon/honey-pancakes.svg',
            level: 'Easy',
            duration: '30mins',
            calories: '180kCal',
            viewisSelected: true
        )
    );
    diets.add(
        DietModel(name: 'Canai Bread',
            iconPath: 'assets/icon/canai-bread.svg',
            level: 'Easy',
            duration: '20mins',
            calories: '230kCal',
            viewisSelected: false
        )
    );
    return diets;

        }
}