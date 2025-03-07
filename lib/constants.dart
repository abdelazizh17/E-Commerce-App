import 'package:e_commerce/core/data/models/product/review.dart';

const String baseUrl = 'https://dummyjson.com/';
const List<String> sizeList = ['S', 'M', 'L', 'XL'];
const List<String> colorList = ['Black', 'White', 'Blue', 'Grey'];
List<Review> reviews = [
  Review(
      reviewerName: 'Helene Moore',
      rating: 5,
      date: DateTime(2025, 7, 10),
      comment:
          'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.'),
  Review(
      reviewerName: 'James Carter',
      rating: 4,
      date: DateTime(2025, 6, 25),
      comment:
          'Nice dress, but the fabric is a bit thinner than expected. The fit is good, and the design is elegant. I would recommend it for casual events.'),
  Review(
      reviewerName: 'Sophia Lee',
      rating: 5,
      date: DateTime(2025, 6, 15),
      comment:
          'Absolutely love this dress! The material is soft, and it flows beautifully. I received so many compliments when I wore it.'),
  Review(
      reviewerName: 'Michael Smith',
      rating: 3,
      date: DateTime(2025, 6, 5),
      comment:
          'The dress looks nice but runs a bit small. I had to return it and order a size up. Otherwise, the style is lovely.'),
  Review(
      reviewerName: 'Emily Johnson',
      rating: 4,
      date: DateTime(2025, 5, 30),
      comment:
          'Great dress for the price! The stitching could be better, but overall, it is stylish and fits well.')
];
