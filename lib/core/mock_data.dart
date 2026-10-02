import 'models/app_models.dart';


String placeholderImage(int seed, {int w = 400, int h = 400}) =>
    'https://picsum.photos/seed/$seed/$w/$h';

const List<String> categoryNames = [
  'Pizza',
  'Burger',
  'Pizza',
  'Sandwich',
  'Chicken',
];

final List<FoodCategory> mockCategories = [
  FoodCategory(
    name: 'Pizza',
    imageUrl: 'assets/images/pizza_category.jpg',
  ),
  FoodCategory(
    name: 'Burger',
    imageUrl: 'assets/images/burger_category.jpg',
  ),
  FoodCategory(
    name: 'Sandwich',
    imageUrl: 'assets/images/pizza_category.jpg',
  ),
  FoodCategory(
    name: 'Chicken',
    imageUrl: 'assets/images/burger_category.jpg',
  ),
];

final List<Restaurant> mockRestaurants = [
  Restaurant(
    id: 'r1',
    name: 'Rose Garden Restaurant',
    tagsLine: 'Burger - Chiken - Riche - Wings',
    rating: 4.7,
    freeDelivery: true,
    timeMinutes: 20,
    imageUrl: 'assets/images/restaurant_1.jpg',
  ),
  Restaurant(
    id: 'r2',
    name: 'Tasty Treat Gallery',
    tagsLine: 'Burger - Fries - Wraps',
    rating: 4.7,
    freeDelivery: true,
    timeMinutes: 20,
    imageUrl: 'assets/images/restaurant_2.jpg',
  ),
  Restaurant(
    id: 'r3',
    name: 'Spicy Restaurant',
    tagsLine: 'Burger - Sandwich - Pizza',
    rating: 4.7,
    freeDelivery: true,
    timeMinutes: 20,
    imageUrl: 'assets/images/restaurant_1.jpg',
    description:
        'Maecenas dolor eget risus varius blandit sit amet non magna. '
        'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
  ),
  Restaurant(
    id: 'r4',
    name: 'Pansi Restaurant',
    tagsLine: 'Fast Food - Burger',
    rating: 4.7,
    freeDelivery: true,
    timeMinutes: 15,
    imageUrl: 'assets/images/restaurant_2.jpg',
  ),
  Restaurant(
    id: 'r5',
    name: 'American Spicy Burger Shop',
    tagsLine: 'Burger - Spicy',
    rating: 4.3,
    freeDelivery: true,
    timeMinutes: 25,
    imageUrl: 'assets/images/restaurant_1.jpg',
  ),
  Restaurant(
    id: 'r6',
    name: 'Cafenio Coffee Club',
    tagsLine: 'Coffee - Snacks',
    rating: 4.0,
    freeDelivery: false,
    timeMinutes: 10,
    imageUrl: 'assets/images/restaurant_2.jpg',
  ),
];

final List<FoodItem> mockBurgers = [
  FoodItem(
    id: 'b1',
    name: 'Burger Bistro',
    restaurantName: 'Rose Garden',
    price: 40,
    imageUrl: 'assets/images/burger_item.jpg',
    description:
        'Maecenas dolor eget risus varius blandit sit amet non magna. '
        'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
  ),
  FoodItem(
    id: 'b2',
    name: "Smokin' Burger",
    restaurantName: 'Cafenio Restaurant',
    price: 60,
    imageUrl: 'assets/images/burger_item.jpg',
  ),
  FoodItem(
    id: 'b3',
    name: 'Buffalo Burgers',
    restaurantName: 'Kafji Firm Kitchen',
    price: 75,
    imageUrl: 'assets/images/burger_item.jpg',
  ),
  FoodItem(
    id: 'b4',
    name: 'Bullseye Burgers',
    restaurantName: 'Kobab Restaurant',
    price: 94,
    imageUrl: 'assets/images/burger_item.jpg',
  ),
];

final List<FoodItem> mockSpicyRestaurantBurgers = [
  FoodItem(
    id: 's1',
    name: 'Burger Ferguson',
    restaurantName: 'Spicy Restaurant',
    price: 40,
    imageUrl: 'assets/images/burger_item.jpg',
  ),
  FoodItem(
    id: 's2',
    name: "Rockin' Burgers",
    restaurantName: 'Cafecofching',
    price: 40,
    imageUrl: 'assets/images/burger_item.jpg',
  ),
];

const List<String> recentKeywords = ['Burger', 'Sandwich', 'Pizza', 'Sandwich'];

const List<String> foodFilterTags = ['Burger', 'Sandwich', 'Pizza', 'Sandwich'];
