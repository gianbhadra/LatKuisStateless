import 'package:flutter/material.dart';

import 'app_state.dart';
import 'detail_page.dart';
import 'food_item.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, currentIndex, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Resto Kita'),
            centerTitle: true,
          ),

          body: currentIndex == 0
              ? buildHome(context)
              : const ProfilePage(),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) {
              selectedIndex.value = index;
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildHome(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: foodNotifier,

      builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: foods.length,

                itemBuilder: (context, index) {
                  final FoodItem food = foods[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),

                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(food: food),
                          ),
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        child: Row(
                          children: [
                            // ==========================
                            // GAMBAR MAKANAN
                            // ==========================
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10),

                              child: Image.network(
                                food.imageUrl,

                                width: 90,
                                height: 90,

                                fit: BoxFit.cover,

                                // Kalau gambar gagal dimuat,
                                // tampilkan gambar pengganti
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    width: 90,
                                    height: 90,
                                    color: Colors.grey.shade300,
                                    child: const Icon(
                                      Icons.restaurant,
                                      size: 40,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 12),

                            // ==========================
                            // INFORMASI MAKANAN
                            // ==========================
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    food.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    food.description,
                                    maxLines: 2,
                                    overflow:
                                        TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    'Rp ${food.formattedPrice}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    'Total: Rp ${food.formattedTotal}',
                                    style: TextStyle(
                                      color: Colors.orange.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ==========================
                            // TOMBOL QUANTITY
                            // ==========================
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    increaseQuantity(food);
                                  },

                                  icon: const Icon(
                                    Icons.add_circle,
                                  ),
                                ),

                                Text(
                                  '${food.quantity}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    decreaseQuantity(food);
                                  },

                                  icon: const Icon(
                                    Icons.remove_circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ==========================
            // GRAND TOTAL
            // ==========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),

              child: Text(
                'Total Pesanan: Rp ${formatPrice(grandTotal)}',

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}