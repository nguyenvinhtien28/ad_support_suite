part of utils;

class ConvertNumber {
  static String shortenPriceProduct(double price) {
    if (price < 1000) return  removeLastDot0(price.toString());

    if (price < 1000000) {
      return "${removeLastDot0((price / 1000).toStringAsFixed(1))}K";
    }

    return "${removeLastDot0((price / 1000000).toStringAsFixed(1))}M";
  }

  static String removeLastDot0(String originalValue) {
    if (!originalValue.endsWith('.0')) return originalValue;

    return originalValue.split('.').first;
  }
}
