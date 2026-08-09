class Drinkitem {
  final String title;
  final String description;
  final String img;

  final double sPrice;
  final double lPrice;

  final List<int> sugarLevels;
  final List<String> iceOptions;
  final bool hasCoffee; 

  Drinkitem({
    required this.title,
    required this.description,
    required this.img,
    required this.sPrice,
    required this.lPrice,
    required this.sugarLevels,
    required this.iceOptions,
    required this.hasCoffee,
  });
}