const String baseUrl = 'https://dummyjson.com/';
const List<String> sizeList = ['S', 'M', 'L', 'XL'];
const List<String> colorList = ['Black', 'White', 'Blue', 'Grey'];
const Map<String, String> categoryMapping = {
  "Women": "women",
  "Men": "men",
  "Beauty & Personal Care": "beauty",
  "Home & Furniture": "home",
  "Groceries": "groceries",
  "Electronics": "electronics",
  "Accessories & Gadgets": "accessories",
  "Vehicles": "vehicles",
};

const List<String> tabs = [
  "Women",
  "Men",
  "Beauty & Personal Care",
  "Home & Furniture",
  "Groceries",
  "Electronics",
  "Accessories & Gadgets",
  "Vehicles"
];

const Map<String, String> orderdMap = {
  'Popular': '',
  'Price: lowest to high': 'asc',
  'Price: highest to low': 'desc',
};
const Map<String, String> sortedByMap = {
  'Popular': 'popular',
  'Price: lowest to high': 'price',
  'Price: highest to low': 'price',
};
const List<String> options = [
  'Popular',
  'Price: lowest to high',
  'Price: highest to low',
];
