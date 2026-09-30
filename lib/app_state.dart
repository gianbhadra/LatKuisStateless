import 'package:flutter/material.dart';
import 'food_item.dart';

// Menyimpan semua data makanan
final List<FoodItem> foods = FoodItem.sampleData;

// Notifier khusus untuk memberi tahu UI
// bahwa quantity makanan berubah
final ValueNotifier<int> foodNotifier = ValueNotifier<int>(0);

// Notifier untuk Bottom Navigation
// 0 = Home
// 1 = Profile
final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

// Menambah quantity
void increaseQuantity(FoodItem food) {
  food.quantity++;

  // Memberi tahu widget yang mendengarkan foodNotifier
  foodNotifier.value++;
}

// Mengurangi quantity
void decreaseQuantity(FoodItem food) {
  if (food.quantity > 0) {
    food.quantity--;

    // Memberi tahu widget yang mendengarkan foodNotifier
    foodNotifier.value++;
  }
}

// Menghitung total seluruh pesanan
int get grandTotal {
  return foods.fold(
    0,
    (sum, food) => sum + food.totalPrice,
  );
}