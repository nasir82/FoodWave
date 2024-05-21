class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCatagory catagory;
  List<Addon> availableAddon;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.catagory,
      required this.availableAddon
      });
}

//food categort

enum FoodCatagory{
  burgers,
  salads,
  sides,
  drinks,
  dessert
}

class Addon{
  String name;
  double price;
  Addon({required this.name, required this.price});
}