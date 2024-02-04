class Food {
  String name;
  String prix;
  String imagePath;
  String note;

  Food({
    required this.name,
    required this.prix,
    required this.imagePath,
    required this.note,
  });

  String get _name => name;
  String get _prix => prix;
  String get _imagePath => imagePath;
  String get _note => note;
}
