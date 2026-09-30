import 'package:flutter/material.dart';

import 'app_state.dart';
import 'food_item.dart';

class DetailPage extends StatelessWidget {
  final FoodItem food;

  const DetailPage({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),

      body: ValueListenableBuilder<int>(
        valueListenable: foodNotifier,

        builder: (context, value, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ==========================
                // GAMBAR
                // ==========================
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),

                  child: Image.network(
                    food.imageUrl,

                    width: double.infinity,
                    height: 250,

                    fit: BoxFit.cover,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.grey.shade300,

                        child: const Icon(
                          Icons.restaurant,
                          size: 80,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  food.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'Harga: Rp ${food.formattedPrice}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Jumlah Pesanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    IconButton(
                      onPressed: () {
                        decreaseQuantity(food);
                      },

                      icon: const Icon(
                        Icons.remove_circle,
                        size: 40,
                      ),
                    ),

                    const SizedBox(width: 20),

                    Text(
                      '${food.quantity}',

                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 20),

                    IconButton(
                      onPressed: () {
                        increaseQuantity(food);
                      },

                      icon: const Icon(
                        Icons.add_circle,
                        size: 40,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    'Total: Rp ${food.formattedTotal}',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade800,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}