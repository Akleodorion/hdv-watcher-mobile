enum PriceType {
  unit,
  tenth,
  hundred,
  unknown;

  const PriceType();

  String get headerName {
    switch (this) {
      case PriceType.unit:
        return "unit_price";
      case PriceType.tenth:
        return "tenth_price";
      case PriceType.hundred:
        return "hundred_price";
      default:
        return "unknown";
    }
  }
}

// ignore: non_constant_identifier_names
List<PriceType> PRICETYPES = [
  PriceType.unit,
  PriceType.tenth,
  PriceType.hundred
];
