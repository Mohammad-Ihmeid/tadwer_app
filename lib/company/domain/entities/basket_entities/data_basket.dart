class DataBasket {
  final double count;
  final String wasteName;
  final bool isSelect;
  final int basId;
  final int wastId;
  bool showEdite;

  DataBasket({
    required this.count,
    required this.wasteName,
    required this.isSelect,
    required this.basId,
    required this.wastId,
    this.showEdite = false,
  });
}
