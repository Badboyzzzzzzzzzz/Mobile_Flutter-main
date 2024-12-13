import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

final List<GroceryItem> dummyGroceryItems = [
  const GroceryItem(name: 'Milk', quantity: 1, category: GroceryCategory.dairy),
  const GroceryItem(
      name: 'Bananas', quantity: 5, category: GroceryCategory.fruit),
  const GroceryItem(
      name: 'Beef Steak', quantity: 1, category: GroceryCategory.meat),
];

enum Mode { creating, editing, normal,selection}
